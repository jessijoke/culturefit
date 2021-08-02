class UserSerializer
    include JSONAPI::Serializer
    attributes :name, :password_digest, :email, :user_type, :quizzes
    #has_many :quizzes 
end