# Animatone（アニマトーン）
音楽用語で「元気に、活き活きと」という意味を持つ「animato（アニマート）」と「音」を意味する、「tone（トーン）」を組み合わせ、
「元気で活気の溢れた吹奏楽活動の助けとなれるように」という意味。

サービスリンク：[Animatone](https://www.animatone.jp/)


### ■サービス概要
吹奏楽曲を調べたいけどYoutubeで探している楽曲にたどり着けないという人に
カテゴリや、作曲者ごとに検索ができお気に入りの曲を探すことができる
吹奏楽曲検索サービスです。

### ■メインのターゲットユーザー
- 吹奏楽を始めたばかりの方
- 吹奏楽が好きで、色々な曲を知りたいという方

### ■ユーザーが抱える課題
　コンクール曲等を探す時にYoutubeで検索してもカテゴライズされていないため、楽曲を再生してみないとイメージが掴めなかったり、
 自分が探している楽曲を探すまでに時間がかかってしまう。
　
### ■解決方法
事前にデータベース化された中から条件を指定することで求めているイメージの楽曲のみを視聴することができる

カテゴライズ例）
- 楽曲のカテゴリ（課題曲、オペラ等）
- 作曲者名

また、検索フォームにはオートコンプリートを実装することで楽曲のタイトルをユーザーが覚えていなくても補完入力できるようにして検索をスムーズに行えるように実装

### ■実装済みの機能
- ユーザー登録機能
	- 新規ユーザー作成
	- ログイン機能

- 吹奏楽曲検索機能
	- フリーワード検索（楽曲名、カテゴリ、作曲者名から検索可能）
	- カテゴリから検索
	- 作曲者名から検索

　- お気に入り楽曲ランキング（ユーザーがお気に入り登録した楽曲のランキングが見れる）

- コメント投稿機能
	- 各楽曲の思い出や感想を他のユーザー共有することができる
　
- 管理者機能
	- 登録ユーザーデータの追加、編集、削除機能
	- 吹奏楽曲データの追加、編集、削除機能
	- いいねされたデータの追加、編集、削除機能
	- コメントデータの追加、編集、削除機能

### ■実装予定の機能
- コメントのリアルタイム更新
- 検索結果表示をSPAで行う

### ■なぜこのサービスを作りたいのか？
私は高校生の時に友人に誘われ吹奏楽部に入部をしました。そんな吹奏楽部では毎年、「吹奏楽コンクール」や「定期演奏会」など大きなイベントがあります。
演奏する楽曲は生徒が意見を出し合って、決めることが多いです。楽曲を探す際にはインターネットで検索したりYoutubeで「吹奏楽　コンクール曲」などのワードで検索をしますが、
吹奏楽曲検索に特化しているわけではないので関係の無い曲が表示されたり、カテゴライズされていないため実際に、試聴してみるまでどんな楽曲がわからないという悩みがありました。

そんな時に簡単に吹奏楽曲の検索をスムーズに行うことができ、探している楽曲にたどり着くことができればいいのになと思っていました。

こんな経験から、自分と同じように悩む吹奏楽初心者の助けとなるアプリを作ろうと思い作成いたしました！
### ■画面遷移図
https://www.figma.com/file/FKVg4NjENeoZkKKf839zZ3/Brass_Search?node-id=0%3A1&t=EjZn6QMq0wFwpv5Z-0

### ■ER図
https://drive.google.com/file/d/1WY3O_7o_UxLmcmNx0HAAVnUKGBBp9Pd-/view
