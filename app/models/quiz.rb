class Quiz < ApplicationRecord
    belongs_to :user
    validates :quiz_name, uniqueness: true
    has_many :quiz_questions

    def get_answers
        self.quiz_questions.map do |question|
            #byebug
            question.quiz_answers
        end
    end

    def custom_quiz_hash
        h = {
            name: self.quiz_name,
            user_id: self.user_id,
            quiz_id: self.id,
            questions: {}
        }
        #quiz name
        #--question
        ##----answer
        ###------answer attribute

        self.quiz_questions.each.with_index(1) do |question, index|
            h[:questions][index] = {
                question_id: question.id,
                question_name: question
            }
        end

        h[:questions].each do |question_number, hash|
            hash[:answers] = {}
            question = self.quiz_questions.find{ |q| q.id == hash[:question_id]}
            question.quiz_answers.each.with_index(1) do |answer, index|
                hash[:answers][index] = {
                    answer_id: answer.id,
                    answer_name: answer
                }
            end
        end

        h
    end

end
