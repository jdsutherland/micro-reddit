# Micro-Reddit

A tiny version of reddit featuring link submissions and commenting. No front-end.

* Users do NOT need to be able to comment on comments… each comment refers to a Post
* don’t worry about login/logout or securing the passwords right now

Data Model
----------
```
Users
  username:str [uniq, 4-12 chars, present]
  email:str [uniq, present]
  password:str [6-16 chars, present]
  has_many posts

Posts
  title:str [uniq, present]
  url:str [present]
  author_id:int [present]
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
```
rails g model User username:string:uniq email:string:uniq password:string
rails db:migrate
```
2. Add RSpec w/ Shoulda matchers (for validate_X_of)
