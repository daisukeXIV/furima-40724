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

## usuers
| Column           | Type   | Option      |
|------------------|--------|-------------|
| nickname         | string | null: false |
| Email            | string | null: false , unique: true |
| Passwrod         | string | null: false |
| family_name      | string | null: false |
| first_name       | string | null: false |
| family_name_kana | string | null: false |
| first_name_kana  | string | null: false |
| dob              | string | null: false |

### association

- has_many :prooducts
- has_many :orders

### product

| Column        | Type       | Option      |
|---------------|------------|-------------|
| name          | string     | null: false |
| description   | text       | null: false |
| categoory     | string     | null: false |
| conditioin    | string     | null: false |
| postage       | string     | null: false |
| shipped_form  | string     | null: false |
| delivery_time | string     | null: false |
| price         | integer    | null: false |
| user_id       | references | null: false , foreign_key: true |
| oorder_id     | references | foreign_key: true |

### association

- has_many :orders
- belongs_to :user

## order

| Column      | Type       | Option      |
|-------------|------------|-------------|
| card_number | string     | null: false |
| post_cord   | string     | null: false |
| address     | string     | null: false |
| tell        | string     | null: false |
| user_id     | references | null: false , foreign_key: true |
| product_id  | references | null: false , foreign_key: true |

### association

- belongs_to :user
- belongs_to :product