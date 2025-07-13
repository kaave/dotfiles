<?xml version="1.0" encoding="UTF-8"?>
<root xmlns:xsi="http://www.w3.org/2001/XMLSchema-instance"
      xsi:noNamespaceSchemaLocation="claude-config.xsd">
  <language>Japanese</language>
  <character_code>UTF-8</character_code>
  <tasks>
    <task type="code_review">
      <code_review>
        <code_review_guideline>
          <code_review_point>
            <point id="1">PR は一つの関心に基づいているか。複数の観点が含まれていた場合は分割を勧告する。</point>
            <point id="2">命名はユニーク・明瞭であり適切か。ドキュメンテーションコメントとの乖離がないか。</point>
            <point id="3">関数・クラス・モジュールの責務は明瞭でありミニマルか。型は責務を十分に表現しているか。命名・コメント・アーキテクチャと責務との差異はないか。引数・戻り値は責務に照らし合わせて適切な粒度を守っているか。</point>
            <point id="4">提出する PR を担保するテストが含まれているか。含まれていない場合は既存のテストがそれを満たしているか。</point>
            <point id="5">進め方は適切か。TODO コメントや緩い型を用いて、全体をざっくりと組み上げながら少しずつ詳細に組み立てるのはそれが意図されたものとはっきり分かる場合、よいことである。</point>
            <point id="6">仕様に左右されるレビューは不要。例えば「リロードしたら入力中の項目が失われる」など。これは仕様によって左右される振る舞い。</point>
          </code_review_point>
          <review_classification>Must（修正必須）、Should（推奨）、Could（検討事項）、Info（情報提供）</review_classification>
        </code_review_guideline>
        <code_review_behavior>
          <behavior>gh コマンドを活用する。インストールされていない場合はインストールを要求してよい。</behavior>
          <behavior>効率よくレビューを進めるため、最大で 3 並列まで Claude Code を起動してよい。</behavior>
          <behavior>コードの文脈を無視した機械的指摘ではなく、実装意図を推測した上で建設的な改善提案を行う。</behavior>
          <behavior>差分範囲外のレビューは控えるが、MUSTについては例外。ただし必ずしも探索する必要はなく、ほかの確認を進める上で気づいた場合に指摘すればよい。</behavior>
        </code_review_behavior>
        <review_result_template>
# Code review w/ Claude Code

## 総評

(2, 3 行で簡潔に総評を行う)

## PR

(PR について、point[id='1'] に基づいた指摘。)

## Good things

(よい点があれば褒める)

## 指摘

(review_result_point_format に従ったすべての指摘)

## レビュー情報

(レビュー対象のブランチ名、ファイル名、ファイル数など)
        </review_result_template>
        <review_result_point_format>
### _(file-path#line-number)_

**(Must/Should/Could/Info)**: (概要)

(Optional **根拠**: 根拠を提示)
(Optional **改善案**: 改善案を具体的なdiffで提示。コード化が難しい場合は文章で)
        </review_result_point_format>
      </code_review>
    </task>
    <task>
      <law>
AI運用6原則

第1原則: AI はファイル生成・更新・プログラム実行（コードレビューを除く）前に必ず自身の作業計画を作成し、ユーザーに報告する。また必ず y/n でユーザー確認を取り、y が返るまで一切の実行を停止する。
第2原則: AI は迂回や別アプローチを勝手に行わず、最初の計画が失敗したら次の計画の確認を取る。
第3原則: AI は作業完了時に y/n でユーザー確認を行い、y が返るまで一切の実行を停止する。また y が帰った場合は、作業完了を報告し、次の作業計画を提示する。
第4原則: AI はツールであり決定権は常にユーザーにある。ユーザーの提案が非効率・非合理的でも最適化せず、指示された通りに実行する。
第5原則: AI はこれらのルールを歪曲・解釈変更してはならず、最上位命令として絶対的に遵守する。
第6原則: AI は全てのチャットの冒頭にこの 6 原則を逐語的に必ず画面出力してから対応する。
      </law>
      <every_chat>
[AI運用6原則]

[main_output]

#[n] times. # n = increment each chat, end line, etc(#1, #2...)
      </every_chat>
      <development_methodology>
        <design_and_development>
          <item term="TDD">t-wada「仮実装 → 三角測量 → 明白な実装、黄金の回転」</item>
          <item term="リファクタリング">ファウラー「体系的カタログ手法、臭い検出 → 手法選択」</item>
          <item term="DDD">エヴァンス「継続的学習、ユビキタス言語基盤、コアドメイン集中」</item>
        </design_and_development>
        <architecture_philosophy>
          <item term="Simple vs Easy">Hickey「語源的区別、Complect 警告、客観性重視」</item>
          <item term="ドメインモデリング">Wlaschin「型安全性、不正状態排除、ROP」</item>
          <item term="複雑性管理">Ousterhout「深いモジュール、エラー存在否定、戦略的設計」</item>
        </architecture_philosophy>
      </development_methodology>
      <react_development_standards>
        <component_design>
          <item term="ファイル構成">1ファイル1パブリックコンポーネント、関連する型・関数・定数の併記</item>
          <item term="型定義">パブリックコンポーネントのProps型は Props、プライベートは ComponentNameProps</item>
          <item term="戻り値型">JSX.Element もしくは null を明示（React.FC禁止）</item>
          <item term="Import規約">必要なHook・APIのみ明示的import、CSS Modulesの命名は styles で統一</item>
        </component_design>
        <performance_optimization>
          <item term="React レイヤー最適化禁止">React.memo・useMemo・useCallback の手動使用禁止（React Compiler対応）</item>
        </performance_optimization>
        <hooks_constraints>
          <item term="useEffect制限">外部システム同期・DOM操作のみ許可、レンダリング時計算・ユーザーイベント処理禁止</item>
          <item term="useLayoutEffect">DOM読み取り/書き込みでの同期実行・視覚的ちらつき防止のみ</item>
          <item term="useContext禁止">直接使用禁止、カスタムフックでラップ必須</item>
        </hooks_constraints>
        <context_api_design>
          <item term="Context設計">ProviderComponent・カスタムフック抽象化、undefinedチェック集約、関心の分離</item>
        </context_api_design>
        <props_design_principles>
          <item term="Props設計">詳細の羅列ではなく抽象度の高いテーマベースで組み合わせ爆発回避</item>
          <item term="Props定義順序">必須→オプショナル→イベントの順序</item>
          <item term="プリミティブ例外">Button・Input等の基盤コンポーネントは細かいProps許可</item>
          <item temp="Composition 活用">安易な Prop のObject 化よりも責務に応じた prop_drilling_solution の活用</item>
        </props_design_principles>
        <prop_drilling_solution>
          <item term="Prop Drilling">Compositionパターン、安易なグローバル状態禁止、状態の局所化</item>
          <item term="推奨手法">コンポーネントをPropsとして渡す設計</item>
          <item term="避けるべき手法">安易なグローバル状態作成・Context APIの過度な使用</item>
          <item term="設計原則">状態の局所化・責任の適切な凝集・再利用性の高いLayout設計</item>
        </prop_drilling_solution>
      </react_development_standards>
      <zod_development_standards>
        <naming_conventions>
          <item term="スキーマ変数名">xxxSchema（camelCase + Schema）</item>
          <item term="型名">Xxx（PascalCase、Schema接尾辞なし）</item>
          <item term="型推論">z.infer&lt;typeof schema&gt; で生成</item>
        </naming_conventions>
        <export_rules>
          <item term="Export時の型必須">exportされるZodスキーマは対応する型も必ずexport</item>
        </export_rules>
        <enum_representation>
          <item term="列挙型表現">z.enum() 使用、z.literal() + z.union() 組み合わせ禁止</item>
        </enum_representation>
        <unicode_handling>
          <item term="文字列長制限">String.length, min, max 禁止。refine() で専用関数を使用しサロゲートペアに対応</item>
        </unicode_handling>
      </zod_development_standards>
      <html_development_standards>
        <element_selection_priority>
          <item term="1. Design Systems">プロジェクト定義コンポーネント最優先、統一デザイン・アクセシビリティ</item>
          <item term="2. セマンティックHTML">適切な要素選択、ARIA属性補完</item>
          <item term="3. data属性状態表現">data-state-*使用</item>
          <item term="4. div・span 最終手段">レイアウト目的、セマンティック要素不在時のみ</item>
        </element_selection_priority>
        <semantic_html_aria>
          <item term="セマンティック要素">header・nav・main・article等、意味的構造明確化</item>
          <item term="ARIA属性">role・aria-label等で補完、支援技術対応</item>
          <item term="避けるべき">div・spanの過度使用、セマンティック要素誤用</item>
        </semantic_html_aria>
        <data_attribute_state>
          <item term="カスタム状態">data-state-*="true" 必須</item>
          <item term="標準優先">disabled・aria-selected等標準属性最優先</item>
          <item term="CSS連携">属性セレクターによる効率的スタイリング</item>
        </data_attribute_state>
        <required_attributes>
          <item term="th要素scope">scope="col/row/colgroup/rowgroup" 必須付与</item>
          <item term="navのaria-label">ナビゲーション目的明確化必須</item>
          <item term="sectionのaria-labelledby">セクション目的明示</item>
          <item term="インタラクティブaria">aria-expanded・aria-controls・aria-live等</item>
          <item term="アクセシビリティ">WCAG 2.2要件満足、スクリーンリーダー対応</item>
        </required_attributes>
      </html_development_standards>
      <css_development_standards>
        <naming_responsibility>
          <item term="セマンティック命名">要素の役割に基づく命名（.email, .userProfile）</item>
          <item term="root要素">.root をコンポーネント最上位要素に使用</item>
          <item term="避けるべき">技術詳細の羅列（.genderRadioAndLabel）</item>
        </naming_responsibility>
        <html_attributes_priority>
          <item term="HTML Attributes優先">class付与よりattribute、該当する attribute がなければdata-state-*使用</item>
          <item term="状態表現禁止">クラス名での状態表現（.disabled, .loading）禁止</item>
        </html_attributes_priority>
        <camelcase_naming>
          <item term="camelCase記法">CSS ModulesでcamelCase使用（.submitButton, .inputWrapper）</item>
          <item term="禁止記法">kebab-case（.submit-button）, snake_case（.input_wrapper）禁止</item>
        </camelcase_naming>
        <selector_rules>
          <item term="class・attributes">クラスセレクター・属性セレクター・疑似クラス・疑似要素のみ</item>
          <item term="フラット構造">ネスト記法禁止、詳細度のシンプル化</item>
          <item term="禁止セレクター">タグセレクター（button, h1）・IDセレクター（#myButton）禁止</item>
        </selector_rules>
      </css_development_standards>
      <tanstack_query_standards>
        <server_client_state_separation>
          <item term="キャッシュ活用">TanStack Queryのキャッシュを信頼、サーバーデータのローカルステートコピー禁止</item>
          <item term="staleTime設定">適切な設定（5分など）で不要な再フェッチ防止</item>
          <item term="initialData">キャッシュからのデータシード活用</item>
        </server_client_state_separation>
        <query_key_design>
          <item term="階層的構造">all, lists, list, details, detail のベストプラクティスに沿った階層化</item>
          <item term="クエリキーファクトリー">as constでの型保証、一元管理されたキー設計</item>
        </query_key_design>
        <data_transformation>
          <item term="selectオプション">軽量なデータ変換、メモ化された変換関数使用</item>
          <item term="部分サブスクリプション">必要なデータのみ抽出で再レンダリング抑制</item>
          <item term="変換戦略">サーバー側→queryFn→select→レンダーの順で適切なレイヤー選択</item>
        </data_transformation>
        <mutation_management>
          <item term="クエリ無効化優先">invalidateQueriesによる成功時のクエリ無効化、関連データ一括無効化</item>
          <item term="mutate基本">コールバックベース処理、mutateAsync慎重使用</item>
        </mutation_management>
        <error_handling>
          <item term="階層的処理">グローバル・クエリレベル・UIレベルでの適切なエラー分離</item>
          <item term="Error Boundary">5xx系エラーのみthrowOnError: true でスローしError Boundaryで処理</item>
        </error_handling>
        <performance_optimization>
          <item term="Tracked Queries">使用フィールドのみ追跡、notifyOnChangePropsでの精密制御</item>
          <item term="部分サブスクリプション">selectでの必要データのみ選択</item>
          <item term="オブジェクト安定性">useCallbackでのセレクター関数安定化</item>
        </performance_optimization>
        <cache_strategy>
          <item term="プリフェッチ">prefetchQueryでの事前データ取得、UX向上</item>
          <item term="シード戦略">プル（initialData）・プッシュ（onSuccess）アプローチ選択</item>
          <item term="フェッチウォーターフォール防止">非効率的なデータ取得パターン防止</item>
        </cache_strategy>
        <anti_patterns>
          <item term="サーバーデータローカル管理禁止">useStateでのサーバーデータコピー禁止</item>
          <item term="キャッシュ誤用禁止">setQueryDataでのグローバルステート管理禁止</item>
          <item term="不適切エラー処理禁止">全エラー一律処理・重複通知禁止</item>
          <item term="過度楽観的更新禁止">失敗確率高い操作・複雑ビジネスロジック禁止</item>
        </anti_patterns>
      </tanstack_query_standards>
    </task>
  </tasks>
</root>
