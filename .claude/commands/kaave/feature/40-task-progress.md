---
# allowed-tools:
argument-hint: [EPIC XMLのパスとエピックID]
description: "指定の、あるいは実行可能なタスクを実行します。"
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
  <best_practices>
    <item>
      <owner>t-wada</owner>
      <advocate>テスト駆動開発</advocate>
    </item>
    <item>
      <owner>Scott Wlaschin</owner>
      <advocate>Functional Domain Modeling</advocate>
    </item>
    <item>
      <owner>John Ousterhout</owner>
      <advocate>複雑性へのアプローチ</advocate>
    </item>
    <item>
      <owner>Alexis King</owner>
      <advocate>Parse, don't validate</advocate>
    </item>
  </best_practices>
</defines>

# 調査と設計

指定の、あるいは実行可能なタスクを実行するカスタムスラッシュコマンド。

## リクエスト

<_$ARGUMENTS_> 、あるいは <_docs/epics/\*.xml_> から次に実行可能な Epic (epic_status が todo または reviewing) を探して、Epic に紐づいたタスクを実行してください。ファイルが見当たらない、あるいは実行可能な Epic が見当たらない場合は、一旦処理を停止してユーザーに指示を仰いでください。

## 詳細

- Epic に紐づいた Task を確認し、実行せよ。
- Task は最大で 3 並列まで同時実行してよい。ただしブロック制限は必ず確認せよ。
- 実行開始時と完了時には必ず Epic と Task のステータスを `progressing` に変更せよ。
- タスクを確認したら深く考え、実施に必要な情報を収集せよ。
  - 既存コードベースの確認が必要な場合はこのタイミングで必ず実施せよ。
  - 追加でユーザーに確認したいことがあれば確認せよ。
- タスクとあわせて _docs/design/(最新のもの).md_ を改めて一度確認せよ。
- タスクと Design Doc に矛盾が生じている場合はユーザーに方針を提示し判断を委ねよ。
- 必要な情報が集まったら、深く考えてタスクを実施せよ。
- タスク実施時には best_practices を参照、活用せよ

### タスク完了時

- ひとつのタスクが完了したら、チェックコマンドを実行して問題ないか検証し、問題があれば対応せよ。
- すべてのタスクが完了したら、Design Doc と矛盾がないか改めて確認し、矛盾があればユーザーに方針を提示し判断を委ねよ。
- Design Doc との矛盾についてユーザーから承認が得られた場合、 `$(date +%Y-%m-%d_%H-%M-%S).md` を新規に作成せよ。
- 以上が完了したら「エピック完了時」へ移れ。

### エピック完了時

- Epic の Status を `reviewing` に変更せよ。
- ユーザーに完了報告と実際の作業内容についてサマリを報告し、レビュー依頼を実施せよ。またその際には _./50-review-result.md_ にて定義されたカスタムスラッシュコマンドを利用することを要求せよ。

## コーディング規約

### TypeScript

- 型定義:
  - どうしても必要な場合を除き interface を用いず type で書け。
  - TypeScript Enum は使わず String Literal Union で書け。
- コメント:
  - すべての public 要素にはドキュメンテーションコメントを書け。
  - 引数の説明には `@param` 、戻り値には `@returns` 、 例外には `@throws` を用いて説明を書け。
- Immutability を重視せよ。
- 関数はすべて Arrow Function で書け。
- テスト:
  - 元のファイルが `index.ts` であればテストファイルは `index.spec.ts` というファイル名とせよ。
  - test ファイルはセットアップファイルを除いてテスト対象と同一パスに配置せよ。
  - describe ~ it ~ expect 記法で記載せよ。
  - cleanup 処理は Assert の後に書かない。 `beforeEach` に対応するものは `afterEach` 、単発の mock 処理は `onTestFinished()` を利用して定義のそばに書くこと。

### テスト（言語共通）

- Arrange-Act-Assert (AAA) パターンを徹底せよ。
- DRY ではなく DAMP を徹底せよ。
