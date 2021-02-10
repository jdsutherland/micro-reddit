FactoryBot.define do
  sequence :email do |n|
    "user#{n}@example.com"
  end

  sequence :username do |n|
    "username #{n}"
  end

  sequence :title do |n|
    "title #{n}"
  end

  sequence :url do |n|
    "http://example.com/#{n}"
  end

  factory :user do
    username
    email
    encrypted_password { 'password' }
  end

  factory :post do
    title
    url
    user
  end
end
