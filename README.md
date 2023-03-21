# テーブル設計

## users テーブル

| Column             | Type                | Options                        |
|--------------------|---------------------|--------------------------------|
| nickname           | string              | null: false,                   |
| email              | string              | null: false, unique: true      |
| encrypted_password | string              | null: false                    |
| last_name          | string              | null: false                    |
| first_name         | string              | null: false                    |
| last_name_reading  | string              | null: false                    |
| first_name_reading | string              | null: false                    |
| birthday           | date                | null: false                    |

### Association

* has_many :items
* has_many :comments
* has_many :orders


## items テーブル

| Column             | Type               | Options                        |
|--------------------|--------------------|--------------------------------|
| item               | string             | null: false                    |
| introduction       | text               | null: false                    |
| price              | integer            | null: false                    |
| category_id        | integer            | null: false                    |
| item_state_id      | integer            | null: false                    |
| delivery_cost_id   | integer            | null: false                    |
| prefecture_id      | integer            | null: false                    |
| delivery_day_id    | integer            | null: false                    |
| user               | references         | null: false, foreign_key: true |     

### Association

- belongs_to :user
- has_many :comments
- has_one :order
- belongs_to :category
- belongs_to :item_status
- belongs_to :delivery_cost
- belongs_to :delivery_region
- belongs_to :delivery_day


## comments テーブル

| Column             | Type       | Options                                |
|--------------------|------------|----------------------------------------|
| comment            | text       | null: false                            |
| user               | references | null: false, foreign_key: true         |
| item               | references | null: false, foreign_key: true         |

### Association

- belongs_to :user
- belongs_to :item


## orders テーブル

| Column             | Type       | Options                                |
|--------------------|------------|----------------------------------------|
| user               | references | null: false, foreign_key: true         |
| item               | references | null: false, foreign_key: true         |

### Association

- belongs_to :user
- belongs_to :item
- has_one :delivery


## deliveries テーブル

| Column             | Type       | Options                                |
|--------------------|------------|----------------------------------------|
| post_code          | string     | null: false                            |
| prefecture_id      | integer    | null: false                            |
| municipality       | string     | null: false                            |
| address_number     | string     | null: false                            |
| building           | string     |                                        |
| phone_number       | string     | null: false                            |
| order              | references | null: false, foreign_key: true         |

### Association

- belongs_to :order
- belongs_to :prefecture