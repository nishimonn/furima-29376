# テーブル設計

## users テーブル

| Column   | Type   | Options     |
| -------- | ------ | ----------- |
| name     | string | null: false |
| email    | string | null: false |
| password | string | null: false |
| family_name | string | nill: false |
| first_name| string | null: false |
| family_name(フリガナ) | string | nill: false |
| first/name(フリガナ) | string | nill: false |
| birthday | date | nill: false |


### Association

- has_many :items
- has_many :buy


## items テーブル

| Column | Type   | Options     |
| ------ | ------ | ----------- |
| items_name | text | null: false |
| 商品説明 | text | nill: false |
| カテゴリー | integer | nill: false |
| 商品状態 | integer | nill: false |
| 配送料の負担 | integer | nill: false |
| 発送元の地域 | integer | nill: false |
| 発送までの日数 | integer | nill: false |
| selling price | integer | nill: false |

### Association

- belongs_to :users
- has_many :buy


## buy テーブル

| Column | Type       | Options                        |
| ------ | ---------- | ------------------------------ |
| items_id | references | null: false |
| user_id | references | null: false |
### Association

- has_many :users
- has_many :items
- has_one :shipping_address

## shipping_address
| Column | Type       | Options                        |
| ------ | ---------- | ------------------------------ |
| shipping_address | text | null: false |

- has_one :buy