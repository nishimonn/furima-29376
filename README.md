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
- has_many :buys


## items テーブル

| Column | Type   | Options     |
| ------ | ------ | ----------- |
| items_name | text | null: false |
| item_description | text | nill: false |
| category_id | integer | nill: false |
| items_condition_id | integer | nill: false |
| shipping_fee_burden_id | integer | nill: false |
| shipping_region_id | integer | nill: false |
| days_until_shipping_id | integer | nill: false |
| selling_price | integer | nill: false |
| user | references | null: false, foreign_key: true |

### Association

- belongs_to :user
- has_one :buy


## buys テーブル

| Column | Type       | Options                        |
| ------ | ---------- | ------------------------------ |
| item | references | null: false foreign_key: true |
| user | references | null: false foreign_key: true |
### Association

- belongs_to :user
- belongs_to :item
- has_one :shipping_address

## shipping_address
| Column | Type       | Options                        |
| ------ | ---------- | ------------------------------ |
| postal_code | string | null: false |
| prefectures_id | integer | nill: false |
| city | string | null: false |
| address | string | null: false |
| building_name | string |             |
| phone_number | string | nill: false |
| buy | references | null: false foreign_key: true |


- belongs_to :buy