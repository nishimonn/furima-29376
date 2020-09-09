# テーブル設計

## users テーブル

| Column   | Type   | Options     |
| -------- | ------ | ----------- |
| name     | string | null: false |
| email    | string | null: false |
| password | string | null: false |
| family_name | string | nill: false |
| first_name| string | null: false |
| family_name_kana | string | nill: false |
| first_name_kana | string | nill: false |
| birthday | date | nill: false |


### Association

- has_many :items
- has_many :buy


## items テーブル

| Column | Type   | Options     |
| ------ | ------ | ----------- |
| items_name | text | null: false |
| item_description | text | nill: false |
| category | integer | nill: false |
| items_condition | integer | nill: false |
| shipping_fee_burden | integer | nill: false |
| shipping_region | integer | nill: false |
| days_until_shipping | integer | nill: false |
| selling_price | integer | nill: false |
| user   | references | null: false, foreign_key: true |

### Association

- belongs_to :user
- has_one :buy


## buys テーブル

| Column | Type       | Options                        |
| ------ | ---------- | ------------------------------ |
| items | references | null: false foreign_key: true |
| user | references | null: false foreign_key: true |
### Association

- has_many :users
- has_many :items
- has_one :shipping_address

## shipping_address
| Column | Type       | Options                        |
| ------ | ---------- | ------------------------------ |
| postal_code | integer | null: false |
| prefectures | text | nill: false |
| city | text | null: false |
| address | text | null: false |
| building_name | text | nill: false |
| phone_number | integer | nill: false |


- belongs_to :buy