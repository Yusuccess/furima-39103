# README

This README would normally document whatever steps are necessary to get the
application up and running.

Things you may want to cover:

## users テーブル

| Column             | Type   | Options                        |
| ------------------ | ------ | ------------------------------ |
| last_name          | string | null: false                    |
| first_name         | string | null: false                    |
| last_name_reading  | string | null: false                    |
| first_name_reading | string | null: false                    |
| birthday           | date   | null: false                    |
| email              | string | null: false, unique :true      |
| encrypted_password | string | null: false                    |



### Association
- has_many :items
- has_many :purchases


## items テーブル

| Column             | Type      | Options                        |
| ------------------ | --------- | ------------------------------ |
| category_id        | integer   | null: false                    |
| condition_id       | integer   | null: false                    |
| name               | string    | null: false                    |
| price              | integer   | null: false                    |
| details            | text      | null: false                    |
| shipping_fee_id    | integer   | null: false                    |
| shipping_days_id   | integer   | null: false                    |
| user               | reference | null: false, foreign_key       |
| prefecture_id      | integer   | null: false                    |

### Association
- belongs_to :item
- has_one :purchase


## purchases テーブル

| Column             | Type      | Options                        |
| ------------------ | --------- | ------------------------------ |
| item               | reference | null: false                    |
| user               | reference | null: false                    |


### Association
- belongs_to :user
- belongs_to :item
- has_one :address


## addresses テーブル

| Column             | Type    | Options                        |
| ------------------ | ------- | ------------------------------ |
| postal_code        | string  | null: false                    |
| prefecture_id      | integer | null: false                    |
| city               | string  | null: false                    |
| house_number       | string  | null: false                    |
| building_name      | string  |                                |
| phone_number       | string  | null: false                    |


### Association
- belongs_to :purchase
