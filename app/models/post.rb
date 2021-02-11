class Post < ApplicationRecord
  validates :title, presence: true, uniqueness: true
  validates :url,   presence: true

  belongs_to :user
end
