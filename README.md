# README

This README would normally document whatever steps are necessary to get the
application up and running.

Things you may want to cover:

## users テーブル

| Column             | Type   | Options                        |
| ------------------ | ------ | ------------------------------ |
| name               | string | null: false                    |
| name-reading       | string | null: false                    |
| birthday           | string | null: false                    |
| email              | string | null: false                    |
| password           | string | null: false                    |



### Association
- has_many :items


## items テーブル

| Column             | Type      | Options                        |
| ------------------ | --------- | ------------------------------ |
| category           | string    | null: false                    |
| condition          | string    | null: false                    |
| name               | string    | null: false                    |
| price              | integer   | null: false                    |
| details            | text      | null: false                    |
| shipping-fee       | integer   | null: false                    |
| shipping-days      | integer   | null: false                    |
| user               | reference | null: false                    |

### Association
- belongs_to :item
- has_one :purchase


## purchase テーブル

| Column             | Type      | Options                        |
| ------------------ | --------- | ------------------------------ |
| item               | reference | null: false                    |
| user               | reference | null: false                    |


### Association
- belongs_to :user
- belongs_to :item


## address テーブル

| Column             | Type    | Options                        |
| ------------------ | ------- | ------------------------------ |
| postal_code        | string  | null: false                    |
| prefecture         | integer | null: false                    |
| city               | string  |                                |
| house_number       | string  |                                |
| building_name      | string  |                                |
| phone_number       | string  | null: false                    |


### Association
- belongs_to :purchase
