class QuizQuestionSerializer
    include JSONAPI::Serializer
    attributes :question, :quiz_id
end