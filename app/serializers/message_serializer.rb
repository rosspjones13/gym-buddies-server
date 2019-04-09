class MessageSerializer < ActiveModel::Serializer
  attributes :id, :user_id, :buddy_id, :content, :created_at
end
