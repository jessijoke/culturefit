class QuizAnswerSerializer
    include JSONAPI::Serializer
    attributes :answer, :question_id
end