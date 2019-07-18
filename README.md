# DB設計

## worksテーブル

|Column|Type|Options|
|------|----|-------|
|id|integer||
|title|string|null: false|
|image|string||
|category|string|null: false|
|period|string||
|skill|string||
|charge|string||
|detail|string||
|summary|text|null: false|
|user_id|integer||

### Association
- belongs_to :user

## usersテーブル

|Column|Type|Options|
|------|----|-------|
|id|integer||
|email|string|null: false|
|password|string|null: false|
|password_confirmation|string|null: false|

### Association
- has_many :works
- has_many :gallarys