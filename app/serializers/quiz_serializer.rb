class QuizSerializer < ActiveModel::Serializer
    #include JSONAPI::Serializer
    attributes :quiz_name, :user_id
    has_many :quiz_questions
    
    
end