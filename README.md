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

## users テーブル

| Column                | Type    | Options                   |
| --------------------- | ------- | ------------------------- |
| nickname              | string  | null: false               |
| email                 | string  | null: false, unique: true |
| encrypted_password    | string  | null: false               |
| family_name_kanji     | string  | null: false               |
| first_name_kanji      | string  | null: false               |
| family_name_kana      | string  | null: false               |
| first_name_kana       | string  | null: false               |
| birth_day             | date    | null: false               |

### Association

- has_many :items
- has_many :orders

## items テーブル

| Column                 | Type       | Options                        |
| ---------------------- | ---------- | ------------------------------ |
| user_id                | references | null: false, foreign_key: true |
| name                   | string     | null: false                    |
| explanation            | text       | null: false                    |
| category_id            | integer    | null: false                    |
| condition_id           | integer    | null: false                    |
| shipping_fee_burden_id | integer    | null: false                    |
| prefecture_id          | integer    | null: false                    |
| days_until_shipping_id | integer    | null: false                    |
| price                  | integer    | null: false                    |

### Association

- belongs_to :user
- has_one :order
- has_one_attached :image
- belongs_to_active_hash :category
- belongs_to_active_hash :condition
- belongs_to_active_hash :shipping_fee_burden
- belongs_to_active_hash :prefecture
- belongs_to_active_hash :days_until_shipping

## orders テーブル

| Column  | Type       | Options                        |
| ------- | ---------- | ------------------------------ |
| user_id | references | null: false, foreign_key: true |
| item_id | references | null: false, foreign_key: true |

### Association

- belongs_to :user
- belongs_to :item
- has_one :shipping_addresse

## shipping_addresses テーブル

| Column                | Type    | Options     |
| --------------------- | ------- | ----------- |
| postal_code           | string  | null: false |
| prefecture_id         | integer | null: false |
| city                  | string  | null: false | 
| address               | string  | null: false |
| building_name         | string  |             |
| phone_number          | integer | null: false |

### Association

- belongs_to :order
- belongs_to_active_hash :prefecture