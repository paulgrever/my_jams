class User < ActiveRecord::Base
  has_secure_password
  validates :username, presence: true
  has_many :user_songs
  has_many :songs, through: :user_songs 
end
