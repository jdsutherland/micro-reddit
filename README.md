# Micro-Reddit

A tiny version of reddit to practice data modeling in Rails.

Specification
-------------
* support link submissions and commenting
* Users do NOT need to be able to comment on comments… each comment refers to a Post
* don’t worry about login/logout or securing the passwords right now

Data Model
----------
```
Users
  username:str [uniq, 4-12 chars, present]
  email:str [uniq, present]
  encrypted_password:str [6-16 chars, present]
  has_many posts

Posts
  title:str [uniq, present]
  url:str [present]
  author_id:int [present]
  has_many comments
  belongs_to user

Comments
  body:text [present]
  post_id:int [uniq, present]
  user_id:int [uniq, present]
  belongs_to user
  belongs_to post
```

Recap
-----
1. Generate User model and migrate
    - `rails g model User username:string:uniq email:string:uniq password:string`
2. Add RSpec w/ Shoulda matchers (for validate_X_of)
3. Rename User.password -> User.encrypted_password
    - `rails g migration RenamePasswordToEncryptedPasswordInUsers`
    - `rename_column :users, :password, :encrypted_password` (in migration)
4. Add default value for User.encrypted_password
    - `rails g migration AddDefaultToEncryptedPassword`
    - `change_column_default :users, :encrypted_password, ''` (in migration)

5. Add FactoryBot
    - add `config.include FactoryBot::Syntax::Methods` (in rails_helper)
    - create factories (in spec/factories.rb)

6. Generate Post model
    - `rails g model Post user:references title:string:uniq url:string`
    - User hm Posts

7. Generete Comment model
    - `rails g model Comment post:references user:references body:text`
    - User hm Comments
    - Post hm Comments
