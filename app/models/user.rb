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
end
