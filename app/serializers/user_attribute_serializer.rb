class UserAttributeSerializer < ActiveModel::Serializer
  attributes :id, :score, :attr
  belongs_to :user
  belongs_to :quiz
end
