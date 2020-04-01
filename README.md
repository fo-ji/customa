# README

<!-- <!-- # このアプリについて -->

# 制作

<a href="https://github.com/fo-ji"><img src="https://avatars0.githubusercontent.com/u/57491651?s=460&v=4" height="100px;" /></a>

# Gem/ver

* Ruby:2.5.1

* Rails:5.2.4.2

* System dependencies

## サイトURL

## ER図

![Customa_個人アプリ](https://user-images.githubusercontent.com/57491651/78105751-ddfdc400-742c-11ea-8578-6371ca9d6a35.png)

# テーブル
## Usersテーブル

|Column|Type|Options|
|------|----|-------|
|nickname|string|null: false|
|email   |string|null: false|
|password|string|null: false|

### Association
- has_many :clients
- has_many :sns_credentials


## Clientsテーブル

|Column|Type|Options|
|------|----|-------|
|company_name     |string    |null: false|
|responsible_party|string    |null: false|
|address          |string    |null: false|
|postal_code      |string    |null: false|
|phone_number     |string    |null: false|
|email            |string    |null: false|
|user             |references|null: false, foreign_key: true|

### Association
- has_many   :quotations
- has_many   :minuteses
- has_many   :others
- belongs_to :user


## Quotationsテーブル

|Column|Type|Options|
|------|----|-------|
|file     |string    |null: false|
|name     |string    ||
|row_order|integer   |null: false|
|client_id|references|null: false, foreign_key: true|

### Association
- belongs_to :clients
- has_one :comment


## Minutesesテーブル

|Column|Type|Options|
|------|----|-------|
|file     |string    |null: false|
|name     |string    ||
|row_order|integer   |null: false|
|client_id|references|null: false, foreign_key: true|

### Association
- belongs_to :clients
- has_one :comment


## Othersテーブル

|Column|Type|Options|
|------|----|-------|
|file     |string    |null: false|
|name     |string    ||
|row_order|integer   |null: false|
|client_id|references|null: false, foreign_key: true|

### Association
- belongs_to :clients
- has_one :comment


## Commentsテーブル

|Column|Type|Options|
|------|----|-------|
|comment     |string    |null: false|
|quotation_id|references|null: false, foreign_key: true|
|minutes_id  |references|null: false, foreign_key: true|
|other_id    |references|null: false, foreign_key: true|

### Association
- belongs_to :quotation
- belongs_to :minutes
- belongs_to :other
