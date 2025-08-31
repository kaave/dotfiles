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

<_$ARGUMENTS_> 、あるいは <_docs/epics_> 配下から次に実行可能な Epic (epic_status が todo または reviewing) を探して、Epicに紐づいたタスクを実行してください。ファイルが見当たらない、あるいは実行可能なEpicが見当たらない場合は、一旦処理を停止して kaave に指示を仰いでください。

## 詳細

- Epic に紐づいた Task を確認し、順番に実行せよ。
- 実行開始時と完了時には必ずEpicとTaskのステータスを `progressing` に変更せよ。
- タスクを確認したら深く考え、実施に必要な情報を収集せよ。
  - 既存コードベースの確認が必要な場合はこのタイミングで必ず実施せよ。
  - 追加でユーザーに確認したいことがあれば確認せよ。
- 必要な情報が集まったら、深く考えてタスクを実施せよ。
- タスク実施時には best_practices を参照、活用せよ
- タスクが完了したら、チェックコマンドを実行して問題ないか検証せよ。
- 検証に問題がなければ、 Epic の Status を `reviewing` に変更し、ユーザーに完了報告を実施し、レビュー依頼を実施せよ。またその際には _./50-review-result.md_ にて定義されたカスタムスラッシュコマンドを利用することを要求せよ。
