#!/usr/bin/env zsh
# Functions
# This file contains custom shell functions

# Load from .zshrc

if [ -x "`which ffmpeg`" ]; then
    giffy() {
        ffmpeg \
            -i $1 \
            -r 10 \
            $(echo $1 | sed -E 's/\.[a-zA-Z0-9]*$/.gif/')
    }

    mp4fy() {
        ffmpeg \
            -i $1 \
            -vcodec libx264 \
            -pix_fmt yuv420p \
            -vf "scale=trunc(iw/2)*2:trunc(ih/2)*2" \
            -an \
            -crf 26 \
            $(echo $1 | sed -E 's/\.[a-zA-Z0-9]*$/.mp4/')
    }
fi

if [ -x "`which fzf`" ]; then
    fbr() {
        local branches branch
        branches=$(git branch -vv) &&
        branch=$(echo "$branches" | fzf +m) &&
            git checkout $(echo "$branch" | awk '{print $1}' | sed "s/.* //")
    }

    fgh() {
        local branches branch
        branches=$(git --no-pager reflog | awk '$3 == "checkout:" && /moving from/ {print $8}' | grep -vE 'master' | uniq) &&
        branch=$(echo "$branches" | fzf +m) &&
            git checkout $(echo "$branch" | awk '{print $1}' | sed "s/.* //")
    }

    fbrr() {
        local branches branch
        branches=$(git branch --all | grep -v HEAD) &&
        branch=$(echo "$branches" | fzf-tmux -d $(( 2 + $(wc -l <<< "$branches") )) +m) &&
            git checkout $(echo "$branch" | sed "s/.* //" | sed "s#remotes/[^/]*/##")
    }

    fshow() {
        git log \
            --graph \
            --color=always \
            --format="%C(auto)%h%d %s %C(black)%C(bold)%cr" "$@" |
        fzf \
            --ansi \
            --no-sort \
            --reverse \
            --tiebreak=index \
            --bind=ctrl-s:toggle-sort \
            --bind "ctrl-m:execute:
                    (grep -o '[a-f0-9]\{7\}' | head -1 |
                    xargs -I % sh -c 'git show --color=always % | bat -p --paging=always') << 'FZF-EOF'
                    {}
                    FZF-EOF"
    }

    pr-checkout() {
        local prs pr
        prs=$(gh pr list)
        pr=$(echo "$prs" | fzf +s | sed -E 's/([0-9]+).*/\1/')
        gh pr checkout $pr
    }
fi

# git worktree を便利に使うための関数 `gw` (安全装置つき)
#
gw() {
  # --- サブ関数定義 ---

  _gw_usage() {
    echo "Usage: gw <command | workspace_name> [arguments]"
    echo ""
    echo "A helper function to manage git worktrees efficiently."
    echo ""
    echo "Commands:"
    echo "  <workspace_name>          ワークツリーとブランチを作成または切り替えます"
    echo "  list, ls                  ワークツリーの一覧を表示します"
    echo "  cleanup                   マージ済みのワークツリーとブランチを一括削除します"
    echo "  -D, --delete <ws_name>    指定したワークツリーとブランチを削除します"
    echo "  -h, --help                このヘルプメッセージを表示します"
  }

  # ★追加: gwワークツリー内にいるかチェックする関数
  _gw_check_inside_wt() {
    # 現在のワークツリーのルートパスを取得
    # パスに '.git/wt/' が含まれているかで判定
    if [[ "$(git rev-parse --git-dir)" == *'/.git/worktrees/'* ]]; then
      echo "⚠️  Error: 'gw'で作成したワークツリー内ではこの操作はできません。" >&2
      echo "  メインディレクトリに戻ってから再度実行してください。" >&2
      echo "  Hint: cd \"\$(git rev-parse --show-toplevel)\"" >&2
      return 1 # 失敗ステータス
    fi

    return 0 # 成功ステータス
  }


  _gw_list() {
    local repo_root="$1"
    git -C "$repo_root" worktree list
  }

  _gw_delete() {
    local repo_root="$1"
    local workspace_name="$2"
    if [[ -z "$workspace_name" ]]; then
      echo "Error: 削除するWORKSPACE_NAMEを指定してください。" >&2; _gw_usage; return 1
    fi
    cd "$repo_root"
    echo "🗑️  ワークツリーとブランチ '$workspace_name' の削除を試みます..."
    local wt_path_to_remove=".git/wt/$workspace_name"
    if git worktree list | grep -q " $wt_path_to_remove "; then
        echo "Removing worktree: $wt_path_to_remove"
        git worktree remove --force "$wt_path_to_remove"
    else
        echo "Info: ワークツリー '$workspace_name' は見つかりませんでした。"
    fi
    if git rev-parse --verify "$workspace_name" &>/dev/null; then
      echo "Deleting branch: $workspace_name"
      git branch -D "$workspace_name"
    else
      echo "Info: ブランチ '$workspace_name' は見つかりませんでした。"
    fi
    git worktree prune
    echo "✅ 削除が完了しました。"
  }

  _gw_cleanup() {
    local repo_root="$1"
    cd "$repo_root"
    echo "🧹 マージ済みのワークツリーとブランチを一括削除します..."
    # ...(中略)...
    local default_branch
    if git show-ref --verify --quiet refs/heads/main; then
      default_branch="main"
    elif git show-ref --verify --quiet refs/heads/master; then
      default_branch="master"
    else
      echo "Error: 'main' または 'master' ブランチが見つかりません。" >&2; return 1
    fi
    echo "Info: デフォルトブランチは '$default_branch' です。"

    declare -A worktree_map
    while read -r wt_path head branch; do
      worktree_map["$(echo "$branch" | tr -d '[]')"]="$wt_path"
    done < <(git worktree list)
    local to_delete_branches=()
    local merged_branches
    merged_branches=$(git branch --merged "$default_branch" | tr -d '*' | awk '{$1=$1};1' | grep -vE "^${default_branch}$")
    for branch in $merged_branches; do
      if [[ -n "${worktree_map[$branch]}" && "${worktree_map[$branch]}" == *".git/wt/"* ]]; then
        to_delete_branches+=("$branch")
      fi
    done
    if [[ ${#to_delete_branches[@]} -eq 0 ]]; then
      echo "✅ 削除対象のワークツリーはありません。"; return 0
    fi
    echo "以下のワークツリーとブランチが削除されます:"
    for branch in "${to_delete_branches[@]}"; do
      echo "  - Branch: $branch, Worktree: ${worktree_map[$branch]}"
    done
    read -p "よろしいですか？ [y/N]: " answer
    if [[ "$answer" != "y" && "$answer" != "Y" ]]; then
      echo "キャンセルしました。"; return 0
    fi
    echo "削除を開始します..."
    for branch in "${to_delete_branches[@]}"; do
      echo "--- Deleting $branch ---"
      local wt_path_to_remove=".git/wt/$branch"
      git worktree remove --force "$wt_path_to_remove"
      git branch -D "$branch"
    done
    git worktree prune
    echo "✅ 一括削除が完了しました。"
  }

  # --- メイン処理 ---

  if [[ $# -eq 0 ]]; then _gw_usage; return 1; fi
  case "$1" in -h|--help) _gw_usage; return 0 ;; esac

  local repo_root
  if ! repo_root=$(git rev-parse --show-toplevel 2>/dev/null); then
    echo "Error: Gitリポジトリ内ではありません。" >&2; return 1
  fi

  case "$1" in
    list|ls)
      echo "🌳 現在のワークツリー一覧 (at $repo_root):"
      _gw_list "$repo_root"
      ;;
    cleanup)
      # ★追加: cleanup前にもチェック
      if ! _gw_check_inside_wt; then return 1; fi
      _gw_cleanup "$repo_root"
      ;;
    -D|--delete)
      # ★追加: delete前にもチェック
      if ! _gw_check_inside_wt; then return 1; fi
      _gw_delete "$repo_root" "$2"
      ;;
    *)
      # ★追加: 作成/切り替え前にもチェック
      if ! _gw_check_inside_wt; then return 1; fi

      cd "$repo_root"
      local workspace_name="$1"
      mkdir -p ".git/wt"
      local worktree_path=".git/wt/$workspace_name"
      if git worktree list | grep -q " $worktree_path "; then
        echo "🌳 既存のワークツリー '$workspace_name' に切り替えます。"
        cd "$worktree_path"
        if git rev-parse --verify "$workspace_name" &>/dev/null; then
          git switch "$workspace_name"
        fi
      elif git rev-parse --verify "$workspace_name" &>/dev/null; then
        echo "🌿 既存のブランチ '$workspace_name' からワークツリーを作成します。"
        git worktree add "$worktree_path" "$workspace_name"
        cd "$worktree_path"
        echo "✅ ワークツリーを作成し、移動しました: $repo_root/$worktree_path"
      else
        echo "✨ 新しいワークツリーとブランチ '$workspace_name' を 'main' から作成します。"
        if ! git rev-parse --verify "main" &>/dev/null; then
          echo "Error: 'main' ブランチが見つかりません。" >&2; return 1
        fi
        git worktree add -b "$workspace_name" "$worktree_path" main
        cd "$worktree_path"
        echo "✅ ワークツリーとブランチを作成し、移動しました: $repo_root/$worktree_path"
      fi
      ;;
  esac
  return $?
}

autorun_tmux() {
    # Check if we should run tmux
    local should_run_tmux=false
    case "$TERM_PROGRAM" in
        alacritty|iTerm.app) should_run_tmux=true ;;
    esac

    # WSL specific check
    [[ "$WSL_DISTRO_NAME" = "Ubuntu" && -z "$TERM_PROGRAM" ]] && should_run_tmux=true

    [[ "$should_run_tmux" != true ]] && return

    # Run tmux on startup
    # if command -v tmux >/dev/null 2>&1 && [[ -z $TMUX && $- == *l* ]]; then
    if command -v tmux >/dev/null 2>&1 && [[ -z $TMUX ]]; then
        if ! tmux list-sessions >/dev/null 2>&1; then
            tmux -u new-session
            return
        fi

        local sessions="$(tmux list-sessions)"
        local new_session="Start New Session"
        local all_sessions="$sessions\n$new_session:"
        local chosen_session=$(echo -e "$all_sessions" | fzf | cut -d: -f1)

        if [[ "$chosen_session" = "${new_session}" ]]; then
            tmux -u new-session
        elif [[ -n "$chosen_session" ]]; then
            tmux -u attach-session -t "$chosen_session"
        fi
    fi
}

# Docker helper functions (moved from app_settings.zsh)
if command -v docker >/dev/null 2>&1; then
    dstop() { docker stop $(docker ps -a -q); }
    drm() { docker rm $(docker ps -a -q); }
    dri() { docker rmi $(docker images -q); }
    dbu() { docker build -t=$1 .; }
    dalias() { alias | grep 'docker' | sed "s/^\([^=]*\)=\(.*\)/\1 => \2/"| sed "s/['|\']//g" | sort; }
    dbash() { docker exec -it $(docker ps -aqf "name=$1") bash; }
fi

# Pipenv helper function (moved from app_settings.zsh)
if command -v pipenv >/dev/null 2>&1; then
    palias() { alias | grep 'pipenv' | sed "s/^\([^=]*\)=\(.*\)/\1 => \2/"| sed "s/['|\']//g" | sort; }
fi

# Bundler helper function (moved from app_settings.zsh)
if command -v bundle >/dev/null 2>&1; then
    balias() { alias | grep 'bundle' | sed "s/^\([^=]*\)=\(.*\)/\1 => \2/"| sed "s/['|\']//g" | sort; }
fi
