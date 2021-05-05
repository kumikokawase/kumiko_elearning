class Word < ApplicationRecord
    belongs_to :category, foreign_key: "category_id"

    has_many :choices, dependent: :destroy
    accepts_nested_attributes_for :choices
    
    default_scope -> { order('created_at ASC') }

    validates :words, presence: true, length: { maximum:200 }

    validates :category_id, presence: true

end
