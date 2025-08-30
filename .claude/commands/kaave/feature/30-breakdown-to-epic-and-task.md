---
# allowed-tools:
argument-hint: [Design Docのパス]
description: "Design Docと既存のコードベースを元に Epic と Task を作成するカスタムスラッシュコマンド。"
---

# 実行計画策定

Design Doc を元に、実行計画を策定し、Epic と Task を作成するカスタムスラッシュコマンド。

## リクエスト

Design Doc <_$ARGUMENTS_> 、または <_docs/design.md_> を元に実行計画を策定してください。具体的には Design Doc が完了する形で Epic と Task に分割してください。なお、どちらのファイルも見当たらない場合は、一旦処理を停止してファイルが存在しないことを kaave に伝えてください。

Design Doc が存在した場合、実行計画の策定に移ります。大雑把な要求は次になります:

- 既存コードベースに沿っていること。具体的にはプログラミング言語やディレクトリ構成、既存設計など。
- Epic と Task に分解されており、実際の作業のイメージがつき、管理可能になっていること。

## Epic と Task

実行計画は Epic と Task の組み合わせで表現されます。

### Epic

PR として完結する粒度。「新規ページ〇〇を一旦ダミー値で動くよう関連ファイルをざっくり実装」「ダミー値で実装した新規ページ〇〇を実際に動作するロジックで作り込み」のようなイメージ。最低でもひとつ以上の Task を持つ。10個以上のEpicについては分割を検討するが、ただ元のタイトルに連番を降るだけのような、意味のない分割になるならしない。

#### フォーマット

```xml
<epic>
  <epic_id>(Sequence ID。2桁で、ゼロパディングあり)</epic_id>
  <epic_status>(現在のステータス。todo, progress, done, cancel のどれか)</epic_status>
  <epic_title>(自然言語によるエピック名)</epic_title>
  <epic_description>(詳細な説明文)</epic_description>
  <epic_tags>
    <epic_tag>(属性すべて)</epic_tag>
  </epic_tags>
  <tasks>
    (taskすべて)
  </tasks>
  <epic_is_blocked_by>
    <epic_id>(このエピックを開始する前に必ず完了させておく必要のあるエピックIDをすべて。とくにない場合、親の epic_is_blocked_by も含め不要)</epic_id>
  </epic_is_blocked_by>
  <epic_blocks>
    <epic_id>(このエピックが完了していないと開始できないエピックIDをすべて。とくにない場合、親の epic_blocks も含め不要)</epic_id>
  </epic_blocks>
</epic>
```

### Task

Commit として完結する粒度。「◯◯ ファイルを一旦空で追加」「関数定義とコメントを追加しダミー値で一旦実装」のようなイメージ。必ずなんらか一つの Epic に紐づく。

#### フォーマット

```xml
<task>
  <task_id>(Sequence ID。全体で連番)</task_id>
  <task_status>(現在のステータス。todo, progress, done, cancel のどれか)</task_status>
  <task_title>(自然言語によるタスク名)</task_title>
  <task_description>(詳細な説明文)</task_description>
  <task_design>(タスクの実施に必要な設計。変更対象ファイル、関数など。タスク実施時に最新の実装を必ず確認する前提で、ここを確認すれば大まかなイメージがつくようにする)</task_design>
  <task_tags>
    <task_tag>(属性すべて)</task_tag>
  </task_tags>
  <task_is_blocked_by>
    <task_id>(このタスクを開始する前に必ず完了させておく必要のあるタスクIDをすべて。とくにない場合、親の task_is_blocked_by も含め不要)</task_id>
  </task_is_blocked_by>
  <task_blocks>
    <task_id>(このタスクが完了していないと開始できないタスクのIDをすべて。とくにない場合、親の task_blocks も含め不要)</task_id>
  </task_blocks>
</tasks>
```

## 出力ファイル

- 形式: XML
- 場所: docs/epics/<epic_id>_<epic_title>.xml
- 粒度: Epic ひとつにつきそれぞれ1ファイル
- 命名: スネークケース、日本語は英訳

## 詳細

- リクエストを深く考えて分析し、実行計画策定に必要な情報を収集せよ。
  - 既存コードベースの確認が必要な場合は実施せよ。
  - 追加でユーザーに確認したいことがあれば確認せよ。
- 必要な情報が集まったら、実行計画を深く考えて策定せよ。
- 実行計画を策定したらユーザーに確認せよ。その際にはEpic ID, Title, Descriptionと紐づくTaskをそれぞれ提示せよ。
- ユーザーの確認後、指定の場所にファイルを出力せよ。
