class User < ApplicationRecord
    has_secure_password
    validates :name, uniqueness: true
    validates :email, format: { with: URI::MailTo::EMAIL_REGEXP }, uniqueness: true
    has_many :quizzes
    has_many :user_attributes
end
