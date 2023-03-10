# テーブル設計

## users テーブル

| Column             | Type                | Options                        |
|--------------------|---------------------|--------------------------------|
| nickname           | string              | null: false, unique: true      |
| email              | string              | null: false, unique: true      |
| password           | string              | null: false                    |
| real_name          | string              | null: false                    |
| birthday           | integer             | null: false                    |

### Association

* has_many :items
* has_many :comments
* has_one :order


## items テーブル

| Column             | Type               | Options                        |
|--------------------|--------------------|--------------------------------|
| item               | string             | null: false                    |
| image              | text               | null: false                    |
| text               | text               | null: false                    |
| price              | integer            | null: false                    |
| shipping_cost      | string             | null: false                    |
| item_status        | string             | null: false                    |
| shipping_date      | string             | null: false                    |
| user               | references         | null: false, foreign_key: true |

### Association

- belongs_to :user
- has_many :comments


## comments テーブル

| Column             | Type       | Options                                |
|--------------------|------------|----------------------------------------|
| text               | text       | null: false                            |
| user               | references | null: false, foreign_key: true         |
| item               | references | null: false, foreign_key: true         |

### Association

- belongs_to :user
- belongs_to :item


## orders テーブル

| Column             | Type       | Options                                |
|--------------------|------------|----------------------------------------|
| address            | string     | null: false                            |
| phone_number       | references | null: false, foreign_key: true         |
| user               | references | null: false, foreign_key: true         |

### Association

- belongs_to :user