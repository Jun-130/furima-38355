# テーブル設計

## users テーブル

| Column             | Type   | Options     |
| ------------------ | ------ | ----------- |
| email              | string | null: false |
| encrypted_password | string | null: false |
| nickname           | string | null: false |
| last_name          | string | null: false |
| first_name         | string | null: false |
| kana_last_name     | string | null: false |
| kana_first_name    | string | null: false |
| birth_date         | date   | null: false |

### Association

- has_one :address, dependent: :destroy
- has_one :card, dependent: :destroy
- has_many :items, dependent: :destroy
- has_many :orders

## addresses

| Column             | Type       | Options                        |
| ------------------ | ---------- | ------------------------------ |
| zip_code           | string     | null: false                    |
| prefecture_id      | integer    | null: false                    |
| city               | string     | null: false                    |
| street             | string     | null: false                    |
| building           | string     |                                |
| phone_number       | string     | null: false                    |
| user               | references | null: false, foreign_key: true |

### Association

- belongs_to :user
- belongs_to :prefecture

## cards

| Column      | Type       | Options                        |
| ----------- | ---------- | ------------------------------ |
| customer_id | integer    | null: false                    |
| token_id    | integer    | null: false                    |
| user        | references | null: false, foreign_key: true |

### Association

- belongs_to :user

## items テーブル

| Column             | Type       | Options                        |
| ------------------ | ---------- | ------------------------------ |
| name               | string     | null: false                    |
| description        | text       | null: false                    |
| price              | integer    | null: false                    |
| category_id        | integer    | null: false                    |
| condition_id       | integer    | null: false                    |
| shipping_charge_id | integer    | null: false                    |
| prefecture_id      | integer    | null: false                    |
| shipping_day_id    | integer    | null: false                    |
| user               | references | null: false, foreign_key: true |

### Association

- has_one :order, dependent: :destroy
- belongs_to :user
- belongs_to :prefecture
- belongs_to :category
- belongs_to :condition
- belongs_to :shipping_charge
- belongs_to :shipping_day
- has_one_attached :image

## orders テーブル

| Column | Type       | Options                        |
| ------ | ---------- | ------------------------------ |
| user   | references | null: false, foreign_key: true |
| item   | references | null: false, foreign_key: true |

### Association

- belongs_to :item
- belongs_to :user


# Active Hash

## prefectures

### Association

- has_many :addresses
- has_many :items

## categories

### Association

- has_many :items

## conditions

### Association

- has_many :items

## shipping_charges

### Association

- has_many :items

## shipping_days

### Association

- has_many :items