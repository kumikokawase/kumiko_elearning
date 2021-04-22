class Category < ApplicationRecord

    default_scope -> { order('created_at DESC') }

    validates :title, presence: true, length: { minimum: 2 }
    validates :description, presence: true, length: {maximum: 140}
end
