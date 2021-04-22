class User < ApplicationRecord
  # user name
  validates :name, presence: true, length: { minimum: 5 }

  # user email
  VALID_EMAIL_REGEX = /\A[\w+\-.]+@[a-z\d\-.]+\.[a-z]+\z/i
  validates :email, presence: true, format: { with: VALID_EMAIL_REGEX }, 
             uniqueness: { case_sensitive: false }
  # user password
  validates :password, length: { minimum: 5}
  has_secure_password

  # Followed Users
  has_many :active_relationships, foreign_key: "follower_id",
                                  class_name: "Relationship",
                                  dependent:  :destroy
  # user.active_relationships.followed_id -> user.followed_users
  has_many :followed_users, through: :active_relationships, source: :followed

  # Followers
  has_many :passive_relationships, foreign_key: "followed_id", # no conflict becauser they have diffrent FK
                                   class_name: "Relationship", # able to use the same table
                                   dependent: :destroy
  has_many :followers, through: :passive_relationships, source: :follower

  # Returns true if the current user is following the other user
  def following?(other_user)
    active_relationships.find_by(followed_id: other_user.id)
  end
  
  # Follows a user
  def follow(other_user)
    active_relationships.create!(followed_id: other_user.id)
  end

  # Unfollows a user
  def unfollow(other_user)
    active_relationships.find_by(followed_id: other_user.id).destroy
  end

# Admin_user
  has_many :passive_relationships, foreign_key: "admin_user"
  
  def active_user?
    active_relationships.find_by(admin_user: id)
  end  
  
end