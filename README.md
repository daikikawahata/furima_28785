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

| Column               | Type   | Options     |
| -------------------- | ------ | ----------- |
| family_name          | string | null: false |
| first_name           | string | null: false |
| family_name_furigana | string | null: false |
| first_name_furigana  | string | null: false |
| email                | string | null: false |
| password             | string | null: false |
| nickname             | string | null: false |
| birth_day            | date   | null: false |

### Association

- has_many :items
- has_many :buyer

## items テーブル

| Culumn           | Type       | Option                         |
| ---------------- | ---------- | ------------------------------ |
| image            | string     | null: false                    |
| category id      | integer    | null: false                    |
| name             | string     | null: false                    |
| explanation      | string     | null: false                    |
| price            | integer    | null: false                    |
| condition_id     | integer    | null: false                    |
| pay_postage_id   | integer    | null: false                    |
| prefecture_id    | integer    | null: false                    |
| shipping_date_id | integer    | null: false                    |
| user             | references | null: false, foreign_key: true |

### Association

- belongs_to :user
- belongs_to :buyer
- has_one :shipping_address
- belongs_to_active_hash :category
- belongs_to_active_hash :condition
- belongs_to_active_hash :pay_postage
- belongs_to_active_hash :shipping_date
- belongs_to_active_hash :prefecture

## buyers テーブル

| Culumn           | Type       | Option                         |
| ---------------- | ---------- | ------------------------------ |
| user             | references | null: false, foreign_key: true |
| item             | references | null: false, foreign_key: true |
| shipping_address | references | null: false, foreign_key: true

### Association

- belongs_to :user
- has_many :item
- has_one :shipping_address

## shipping_addresses テーブル

| Culumn        | Type       | Option                         |
| ------------- | ---------- | ------------------------------ |
| postal_code   | string     | null: false                    |
| prefecture_id | integer    | null: false                    |
| city          | string     | null: false                    |
| house_number  | string     | null: false                    |
| building_name | string     |                                |
| phone_number  | string     | null: false                    |
| buyer         | references | null: false, foreign_key: true |

### Association

- belongs_to :buyer
- belongs_to :item
- belongs_to_active_hash :prefecture