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

## users
| Column           | Type               | Option      |
|------------------|--------------------|-------------|
| nickname         | string             | null: false |
| email            | string             | null: false , unique: true |
| password         | encrypted_password | null: false |
| family_name      | string             | null: false |
| first_name       | string             | null: false |
| family_name_kana | string             | null: false |
| first_name_kana  | string             | null: false |
| dob              | date               | null: false |

### association

- has_many :prooducts
- has_many :orders

### products

| Column           | Type       | Option      |
|------------------|------------|-------------|
| name             | string     | null: false |
| description      | text       | null: false |
| category_id      | integer    | null: false |
| conditioin_id    | integer    | null: false |
| postage_id       | integer    | null: false |
| shipped_form_id  | integer    | null: false |
| delivery_time_id | integer    | null: false |
| price            | integer    | null: false |
| user             | references | null: false , foreign_key: true |
| order            | references | foreign_key: true |

### association

- has_one :order
- belongs_to :user

- belongs_to :category
- belongs_to :condition
- belongs_to :postage
- belongs_to :shipped_form
- belongs_to :delivery_time

## orders

| Column      | Type       | Option                          |
|-------------|------------|---------------------------------|
| user        | references | null: false , foreign_key: true |
| address     | references | null: false , foreign_key: true |



### association

- belongs_to :user
- belongs_to :product
- has_one :address

## addresses
| Column         | Type       | Option      |
|----------------|------------|-------------|
| post_code      | string     | null: false |
| prefectures    | string     | null: false |
| municipalities | string     | null: false |
| street_address | string     | null: false |
| building       | string     | null: false |
| tell           | string     | null: false |

### association

- belongs_to :order