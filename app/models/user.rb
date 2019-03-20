class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

  has_many :user_followers, foreign_key: :follower_id, class_name: 'Follower'
  has_many :user_followed, foreign_key: :followed_id, class_name: 'Follower'

  has_many :followed, through: :user_followers
  has_many :followers, through: :user_followed

  has_many :questions
  has_many :answers
end
