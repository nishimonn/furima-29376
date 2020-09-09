# テーブル設計

## users テーブル

| Column   | Type   | Options     |
| -------- | ------ | ----------- |
| name     | string | null: false |
| email    | string | null: false |
| password | string | null: false |
| 名前(全角)| string | null: false |
|名前(カナ) | string | nill: false |
| 生年月日  | string | nill: false |


### Association

- has_many :items
- has_many :buy


## items テーブル

| Column | Type   | Options     |
| ------ | ------ | ----------- |
| image  | reference | null: false |
| 商品名  | string | null: false |
| 商品説明 | string | nill: false |
| カテゴリー | string | nill: false |
| 商品状態 | string | nill: false |
| 配送料の負担 | string | nill: false |
| 発送元の地域 | string | nill: false |
| 発送までの日数 | string | nill: false |
| 販売価格 | string | nill: false |

### Association

- has_many :users
- has_many :buy


## buy テーブル

| Column | Type       | Options                        |
| ------ | ---------- | ------------------------------ |
| 商品名   | references | null: false |
| クレジットカード情報 | references | null: false |
| 配送先 | string | nill: false |
### Association

- has_many :users
- has_many :items
