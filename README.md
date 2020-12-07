# テーブル設計

## users テーブル

| Column   | Type   | Options     |
| -------- | ------ | ----------- |
| name     | string | null: false |
| email    | string | null: false |
| password | string | null: false |

### Association

- has_many :books
- has_many :comments


## books テーブル

| Column  | Type   | Options     |
| ------- | ------ | ----------- |
| title   | string | null: false |
| content | text   |             |

### Association

- belongs_to :user
- has_many :pages


## pages テーブル

| Column | Type       | Options                        |
| ------ | ---------- | ------------------------------ |
| title  | string     |                                |
| number | integer    |                                |
| user   | references | null: false, foreign_key: true |

### Association

- belongs_to :room
- has_many :comments


## comments テーブル

| Column  | Type       | Options                        |
| ------- | ---------- | ------------------------------ |
| content | text       |                                |
| user    | references | null: false, foreign_key: true |
| page    | references | null: false, foreign_key: true |

### Association

- belongs_to :user
- belongs_to :page
