---
# allowed-tools:
argument-hint: [Jira Ticket ID / URL]
description: "指定の Jira チケットを確認し、タスクを実行します。"
---

<defines>
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
    <item>
      <owner>kaave</owner>
      <advocate>
        - Arrange-Act-Assert (AAA) パターンを徹底せよ。
        - DRY ではなく DAMP を徹底せよ。
      </advocate>
    </item>
  </best_practices>
</defines>

# 調査と設計

指定の Jira チケットを確認し、記載事項に基づいてタスクを実行するカスタムスラッシュコマンド。

## リクエスト

Jira チケット _$ARGUMENTS_ について、Atlassian MCP を利用して詳細を取得し、記載の処理を実行してください。該当のチケットが見当たらない、あるいはアクセスできない場合は、一旦処理を停止してユーザーに指示を仰いでください。

## 詳細

- 指定の Jira チケットについて詳細を取得せよ。
- 詳細を確認したら深く考えて分析し、具体的な作業プランを練れ。
- 作業プランの策定に障害となりうる事柄はすべてユーザーに確認をとれ。
- タイトル以外なにも書かれていないチケットの場合、ユーザーに先にチケットの詳細を詰めるように伝え、作業を停止せよ。
- 作業プランが固まったらユーザーに提示し実行確認を行え。
- 作業プランの確認がとれたらチケット番号でmainからブランチを切り出し、深く考えてタスクを開始せよ。
- タスク実施時には best_practices を参照、活用せよ。
- タスクが完了したらユーザーにレビューを受けよ。
