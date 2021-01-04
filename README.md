# アプリケーションの概要
購入したお花を記録して共有できる、投稿SNSサービス。

# 環境
* [Web URL](https://hanataba.herokuapp.com/)
* フレームワーク
  <br>
  Ruby on Rails
* データベース
  <br>
  mySQL
* ログインアカウント(テスト用)
  <br>
  メールアドレス: test@test
  <br>
  パスワード: test2021

# 技術的ポイント
* **RSpec**でModel, Request, Systemテスト記述（計135examples）
* レスポンシブ対応
* **Rubocop**を使用したコード規約に沿った開発
* 3つのモデルをそれぞれ関連付けて使用

# アプリケーションの機能
* 記事一覧表示機能
* 記事詳細表示機能
* 記事編集機能
* 記事削除機能
* 記事投稿機能
* ユーザー管理機能
* 画像ファイルのアップロード機能
* DBテーブルのリレーション機能
* DBトランザクションの制御機能
* 検索機能
* コメント機能
* 単体テスト機能
* 統合テスト機能

# 今後実装したい機能
* お気に入り登録機能(**Ajax**を用いた非同期処理)
* お店に行くリスト保存機能(**Ajax**を用いた非同期処理)
* ログ保存機能
* フォロー機能
* 通知機能
* マイページ機能
* ページネーション機能

# 制作意図
祖母はお花が好きでよく花屋で買っていましたが、最近はお花を好きな人が近くにいなくて寂しいとのことでした。もし、購入したお花を投稿してそれにコメント出来たり、同じ趣向を持つお花好きの人たちと繋がれたら祖母も嬉しいだろうなと思い、このアプリを作成しました。

# DB設計

|Column|Type|Options|
|------|----|-------|
| name | string | null: false |
| email | string | unique: true |
| encrypted_password | string | null: false |
| profile | text | |
| picture | string | |

### Association
- has_many :tweets
- has_many :comments

## tweetsテーブル
|Column|Type|Options|
|------|----|-------|
| title | string | null: false |
| description | text | |
| recommended | integer | |
| flower_name | string | |
| prefecture_id | integer | |
| city | string | |
| shop_name | string | |
| user | references | foreign_key: true |

### Association
- belongs_to :user
- has_many :comments

## commentsテーブル
|Column|Type|Options|
|------|----|-------|
| comment_text | text | |
| tweet | references | foreign_key: true |
| user | references | foreign_key: true |

### Association
- belongs_to :user
- belongs_to :tweet
