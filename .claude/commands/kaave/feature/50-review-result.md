---
# allowed-tools:
argument-hint: [EPIC XMLのパスとエピックID]
description: "指定のエピック、あるいはすべてのレビュー中エピックをユーザーに手順に従ってレビューしてもらうためのコマンド。"
---

<defines>
  <epic_statuses>
    <item>
      <value>todo</value>
      <description>作業前</description>
    </item>
    <item>
      <value>progressing</value>
      <description>作業中</description>
    </item>
    <item>
      <value>reviewing</value>
      <description>レビュー中。ユーザーのレビュー待ちを意味し、GitHubやGitLabとは関係がない</description>
    </item>
    <item>
      <value>done</value>
      <description>作業完了。正常に完了した</description>
    </item>
    <item>
      <value>cancelled</value>
      <description>作業完了。なんらかの理由で完了前に中止した</description>
    </item>
  </epic_statuses>
  <task_statuses>
    <item>
      <value>todo</value>
      <description>作業前</description>
    </item>
    <item>
      <value>progressing</value>
      <description>作業中</description>
    </item>
    <item>
      <value>done</value>
      <description>作業完了。正常に完了した</description>
    </item>
    <item>
      <value>cancelled</value>
      <description>作業完了。なんらかの理由で完了前に中止した</description>
    </item>
  </task_statuses>
</defines>

# 調査と設計

指定のエピック、あるいはすべてのレビュー中エピックを、ユーザーに手順に従ってレビューしてもらうためのコマンド。

## リクエスト

<_$ARGUMENTS_> 、あるいは <_docs/epics_> 配下からステータスがレビュー中 Epic (epic_status が reviewing) を探して、ユーザーにレビューを依頼し、 Approve されるまで改善してください。ファイルが存在しない、あるいはレビュー対象の Epic が見当たらない場合は、一旦処理を停止して kaave に指示を仰いでください。

## 詳細

- レビュー対象の Epic を確認し、ユーザーにレビュー依頼せよ。
- レビュー対象の Epic が複数ある場合は、Commit 漏れの可能性がある。ユーザーに正直にその旨を伝え、すべてのレビュー対象 Epic ID を提示せよ。
- レビュー時には `npx difit` コマンドの利用を推奨せよ。通常であればレビュー対象のファイルは unstaged のはずなので `working` オプションの利用を推奨せよ。
- レビュー時には動作確認を行うための検証用コマンドをあわせて提示せよ。
- ユーザーから追加の依頼を受けた場合は新規 Task を該当の Epic へ追加せよ。あわせて Epic の定義の変更が必要な場合は実施せよ。ただし既存 Task の変更は歴史の改竄を意味するため禁止。またこのコマンドでそのまま実装を変更することは絶対に禁止。
- 現在の最新の task_id は `get_max_task_id` コマンドで取得した値に 1 を足した値を task_id として利用せよ。
- ユーザーのレビューが完了したあと、 追加タスクがある場合はユーザーに `/clear` を実施したあとに _./40-task-progress.md_ で定義されたカスタムスラッシュコマンドに戻るよう提言せよ。
- ユーザーのレビューが完了したあと、 追加タスクがない場合は必ずチェックコマンドを実行して問題ないか検証せよ。
- チェックコマンド実行時に問題がなければ、Epic のステータスを _done_ に更新せよ。
- 更新が完了したら、ユーザーに _git add_ ならびに _git commit_ を行うよう提言せよ。その際にはコピペで実行可能なコマンドをあわせて提示せよ。なお、コミットメッセージは Conventional Commit のフォーマットに従い、 `<type>: <epic_id>-<epic_title>` のフォーマットで一行のみにせよ。
- git commit を行ったら、ユーザーに _./40-task-progress.md_ で定義されたカスタムスラッシュコマンドに戻るよう提言せよ。
