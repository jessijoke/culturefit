class AnswerAttributeSerializer
    include JSONAPI::Serializer
    attributes :attribute, :answer_id
end