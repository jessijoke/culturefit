class UserAttributeSerializer < ActiveModel::Serializer
  attributes :id, :score, :attr, :quiz
  belongs_to :user
  belongs_to :quiz
end
