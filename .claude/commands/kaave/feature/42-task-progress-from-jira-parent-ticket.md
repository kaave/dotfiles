---
# allowed-tools:
argument-hint: [Jira Ticket ID / URL]
description: "指定の Jira チケットを確認し、紐づいている子タスクを実行します。"
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

Jira チケット _$ARGUMENTS_ について、Atlassian MCP を利用して紐づいている詳細を取得し、紐づいている子チケットのうち未完了のものを順番に実行してください。該当のチケットが見当たらない、あるいはアクセスできない場合は、一旦処理を停止してユーザーに指示を仰いでください。

## 詳細

1. 指定の Jira チケットについて詳細を取得せよ。
2. 紐づいている子チケットのうち、未完了のチケット一覧をユーザーに提示し実行確認をとれ。
3. 許可を得たら、子チケットを順に実行する。ひとつずつ進めていけ。
4. 子チケットについて、詳細を確認したら深く考えて分析し、具体的な作業プランを練れ。
5. 作業プランの策定に障害となりうる事柄はすべてユーザーに確認をとれ。
6. タイトル以外なにも書かれていないチケットの場合、ユーザーに先にチケットの詳細を詰めるように伝え、作業を停止せよ。
7. 作業プランが固まったらユーザーに提示し実行確認を行え。
8. 作業プランの確認がとれたら子チケット番号でmainからブランチを切り出し、深く考えてタスクを開始せよ。
9. タスク実施時には best_practices を参照、活用せよ。
10. タスクが完了したらユーザーにレビューを受けよ。
