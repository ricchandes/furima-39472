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
| email              | string |unique: true |
| encrypted_password | string | null: false |
| sir-name(kanji)    | string | null: false |
| last-name(kanji)   | string | null: false |
| sir-name(kana)     | string | null: false |
| last-name(kana)    | string | null: false |
| birth-date         |datetime| null: false |
| tell               | integer|unique: true |


### Association

- has_many :items
- has_many :purchases


## items テーブル

| Column         | Type   | Options     |
| -------------- | ------ | ----------- |
| name           | string | null: false |
| explanation    | text   | null: false |
| category       | string | null: false |データを選択
| status         | string | null: false |データを選択
| delivery-price | string | null: false |データを選択
| delivery-region| string | null: false |データを選択
| delivery-date  | string | null: false |データを選択
| price          | integer| null: false |
| user           | references | null: false, foreign_key: true |


### Association

- has_one    :purchase
- belongs_to :user


## purchases テーブル
| Column     | Type       | Options                        |
| ---------- | ------     | ------------------------------ |
| user       | references | null: false, foreign_key: true |
| item       | references | null: false, foreign_key: true |

- belongs_to :item
- belongs_to :user
- has_one    :address


## addresses テーブル

| Column     | Type       | Options     |
| -------    | ---------- | ----------- |
| postcode   | integer    | null: false |
| prefecture | string     | null: false |
| city       | string     | null: false |
| address    | string     |             |
| building   | string     | null: false |
| tell       | integer    | null: false |
| item       | references | null: false, foreign_key: true |

- belongs_to :purchase
