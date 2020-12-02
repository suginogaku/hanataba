## usersテーブル

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

