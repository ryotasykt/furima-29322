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
| password              | string  | null: false               |
| password_confirmation | string  | null: false               |
| family_name_kanji     | string  | null: false               |
| first_name_kanji      | string  | null: false               |
| family_name_kana      | string  | null: false               |
| first_name_kana       | string  | null: false               |
| birth_day             | date    | null: false               |

### Association

- has_many :items
- has_many :purchases

## items テーブル

| Column                | Type       | Options                        |
| --------------------- | ---------- | ------------------------------ |
| user                  | references | null: false, foreign_key: true |
| exhibition_image      | string     | null: false                    |
| item_name             | string     | null: false                    |
| item_description      | text       | null: false                    |
| category              | string     | null: false                    |
| item_condition        | string     | null: false                    |
| shipping_charges      | string     | null: false                    |
| shipping_region       | string     | null: false                    |
| days_until_shipping   | string     | null: false                    |
| price                 | integer    | null: false                    |
| comment               | text       |                                |

### Association

- belongs_to :user
- has_many :purchases

## purchases テーブル

| Column                  | Type       | Options                        |
| ------------------------| ---------- | ------------------------------ |
| user                    | references | null: false, foreign_key: true |
| credit_card_information | integer    | null: false                    |
| expiration_date         | integer    | null: false                    |
| security_code           | integer    | null: false                    |

### Association

- belongs_to :user
- belongs_to :item
- has_one :shipping address

## shipping_addresses テーブル

| Column                | Type    | Options                  |
| --------------------- | ------- | ------------------------ |
| postal_code           | integer | null: false              |
| prefectures           | string  | null: false              |
| city                  | string  | null: false              | 
| address               | string  | null: false              |
| building_name         | string  |                          |
| phone_number          | integer | null: false, unique:true |

### Association

- belongs_to :purchases