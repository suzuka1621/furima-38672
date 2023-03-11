# テーブル設計

## users テーブル

| Column             | Type                | Options                        |
|--------------------|---------------------|--------------------------------|
| nickname           | string              | null: false,                   |
| email              | string              | null: false, unique: true      |
| encrypted_password | string              | null: false                    |
| real_name          | string              | null: false                    |
| real_name_reading  | string              | null: false                    |
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
| user               | references         | null: false, foreign_key: true |
| comment            | references         | null: false, foreign_key: true |

### Association

- belongs_to :user
- has_many :comments
- has_one :order


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
| address            | string     | null: false                            |
| phone_number       | string     | null: false,                           |
| order              | references | null: false, foreign_key: true         |

### Association

- belongs_to :order