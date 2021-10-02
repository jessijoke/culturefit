class Quiz < ApplicationRecord
    belongs_to :user
    validates :quiz_name, uniqueness: true
    has_many :quiz_questions
end
