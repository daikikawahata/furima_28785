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

| Column    | Type   | Options     |
| --------- | ------ | ----------- |
| name      | string | null: false |
| email     | string | null: false |
| password  | string | null: false |
| address   | string | null: false |
| nickname  | string | null: false |
| birth_day | string | null: false |

### Association

- has_many :items

## items テーブル

| Culumn        | Type       | Option                         |
| ------------- | ---------- | ------------------------------ |
| image         | string     | null: false                    |
| category      | string     | null: false                    |
| name          | string     | null: false                    |
| price         | integer    | null: false                    |
| condition     | string     | null: false                    |
| pay_postage   | string     | null: false                    |
| area          | string     | null: false                    |
| shipping_date | string     | null: false                    |
| user_id       | references | null: false, foreign_key: true |

### Association

- belongs_to :user
- belongs_to :buyer
- has_one :shipping_address

## buyers テーブル

| Culumn  | Type       | Option                         |
| ------- | ---------- | ------------------------------ |
| name    | string     | null: false                    |
| item_id | references | null: false, foreign_key: true |

### Association

- has_many :items
- has_one :shipping_address

## shipping_addresses テーブル

| Culumn       | Type       | Option                         |
| ------------ | ---------- | ------------------------------ |
| address      | string     | null: false                    |
| postal_code  | integer    | null: false                    |
| phone_number | integer    | null: false                    |
| buyer_id     | references | null: false, foreign_key: true |

### Association

- belongs_to :buyer
- belongs_to :item