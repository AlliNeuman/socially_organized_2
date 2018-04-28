class User < ApplicationRecord
  has_many :user_calendars
  has_many :calendars, through: :user_calendars
  has_many :posts

  has_secure_password
end
