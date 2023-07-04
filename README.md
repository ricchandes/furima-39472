# README

This README would normally document whatever steps are necessary to get the
application up and running.

Things you may want to cover:

* Ruby version

* System dependencies

* Configuration

* Database creation

* Database initialization

* How to run the test suite

* Services (job queues, cache servers, search engines, etc.)

* Deployment instructions

* ...


# テーブル設計

## users テーブル

| Column             | Type   | Options     |
| ------------------ | ------ | ----------- |
| nickname           | string | null: false |
| email              | string |unique: true,null: false, |
| encrypted_password | string | null: false |
| sir_name_kanji     | string | null: false |
| last_name_kanji    | string | null: false |
| sir_name_kana      | string | null: false |
| last_name_kana     | string | null: false |
| birth_date         | date   | null: false |


### Association

- has_many :items
- has_many :purchases


## items テーブル

| Column            | Type   | Options     |
| --------------    | ------ | ----------- |
| name              | string | null: false |
| explanation       | text   | null: false |
| category_id       | integer| null: false |
| status_id         | integer| null: false |
| delivery_price_id | integer| null: false |
| prefecture_id     | integer| null: false |
| delivery_date_id  | integer| null: false |
| price             | integer| null: false |
| user_id           | references | null: false, foreign_key: true |


### Association

- has_one    :purchase
- belongs_to :user


## purchases テーブル
| Column     | Type       | Options                        |
| ---------- | ------     | ------------------------------ |
| user_id    | references | null: false, foreign_key: true |
| item_id    | references | null: false, foreign_key: true |

- belongs_to :item
- belongs_to :user
- has_one    :address


## addresses テーブル

| Column        | Type       | Options     |
| -------       | ---------- | ----------- |
| postcode      | string     | null: false |
| prefecture_id | integer    | null: false |
| city          | string     | null: false |
| address       | string     | null: false |
| building      | string     |             |
| tell          | string     | null: false |
| purchase_id   | references | null: false, foreign_key: true |

- belongs_to :purchase
