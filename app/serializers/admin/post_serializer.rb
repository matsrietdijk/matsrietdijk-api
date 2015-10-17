module Admin
  class PostSerializer < ActiveModel::Serializer
    attributes :id, :state, :title, :body
  end
end
