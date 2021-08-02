class QuizSerializer
    include JSONAPI::Serializer
    attributes :quiz_name, :user_id
end