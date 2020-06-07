# README

![Image from Gyazo](https://gyazo.com/e6ebcdb1c34c7f74dabdaa211e0c383f)
![Image from Gyazo](https://gyazo.com/312027394be7832f599f315332fa89f8)
![Image from Gyazo](https://gyazo.com/da4250f7a6d7b19a033ffeb59d1dfbf4)

# このアプリについて

保存した書類が見つからない・・デスクトップが散らかりがちな忙しいサラリーマン向けの書類管理ツールです。

# 機能

* 書類アップロード
* 書類へのコメント機能
* 書類検索機能
* 顧客、書類の種類（見積書、議事録、その他）ごとに管理可能
* 最近のアップロード履歴
* bookmark機能
* Googleアカウントでのログイン/サインアップ機能

# 制作

<a href="https://github.com/fo-ji"><img src="https://avatars0.githubusercontent.com/u/57491651?s=460&v=4" height="100px;" /></a>

# Gem/ver

* Ruby:2.5.1

* Rails:5.2.4.2

* System dependencies
 - gem 'mysql2' (0.5.3)
 - gem 'sass-rails'
 - gem 'jquery-rails'
 - gem 'jbuilder'
 - gem 'capistrano'
 - gem 'rspec-rails'
 - gem 'rails-controller-testing'
 - gem 'factory_bot_rails'
 - gem 'pry-rails'
 - gem 'carrierwave'
 - gem 'mini_magick'
 - gem 'bullet'
 - gem 'fog-aws'
 - gem 'unicorn' (5.4.1)
 - gem 'faker'
 - gem 'font-awesome-sass'
 - gem 'haml-rails'
 - gem 'devise'
 - gem 'omniauth'
 - gem 'omniauth-google-oauth2'
 - gem 'omniauth-rails_csrf_protection'
 - gem 'ranked-model'
 - gem 'dropzonejs-rails'

## サイトURL

 パブリックIP: http://http://18.178.66.246/

## ER図

![Customa_個人アプリ](https://user-images.githubusercontent.com/57491651/81266553-e1194f00-907f-11ea-81dd-2e5434b9ca2e.png)

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
- has_many :documents
- has_many :comments
- has_many :bookmarks

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
- has_many   :documents
- belongs_to :user

## Documentsテーブル

|Column|Type|Options|
|------|----|-------|
|document     |string    |null: false|
|name         |string    |null: false|
|category     |integer   |null: false|
|row_order    |integer   ||
|client_id    |references|null: false, foreign_key: true|
|user_id      |references|null: false, foreign_key: true|

### Association
- belongs_to :client
- belongs_to :user
- has_many   :comments
- has_many   :bookmarks

## Commentsテーブル

|Column|Type|Options|
|------|----|-------|
|comment     |string    |null: false|
|document_id |references|null: false, foreign_key: true|
|user_id     |references|null: false, foreign_key: true|

### Association
- belongs_to :document
- belongs_to :user

## Bookmarksテーブル

|Column|Type|Options|
|------|----|-------|
|user_id     |references|null: false, foreign_key: true|
|document_id |references|null: false, foreign_key: true|

### Association
- belongs_to :user
- belongs_to :document
