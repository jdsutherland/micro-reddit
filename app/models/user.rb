class User < ApplicationRecord
  validates :username, presence: true, uniqueness: true
  validates :email,    presence: true, uniqueness: true
  validates :encrypted_password, presence: true
end
