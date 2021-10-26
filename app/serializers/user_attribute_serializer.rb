class UserAttributeSerializer < ActiveModel::Serializer
  attributes :id, :score
  belongs_to :user
  belongs_to :quiz
end
