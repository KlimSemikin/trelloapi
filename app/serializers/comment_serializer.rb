class CommentSerializer < ActiveModel::Serializer
  attributes :id, :content
  belongs_to :user
  class UserSerializer < ActiveModel::Serializer
    attributes :id, :email
  end
end
