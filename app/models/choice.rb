class Choice < ApplicationRecord
    belongs_to :word, foreign_key: "word_id"

    validates :choices, presence: true, length: { minimum: 1 }
    validates :correct_ans, inclusion: { in: [true, false] }

end
