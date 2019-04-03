class BuddySerializer < ActiveModel::Serializer
  attributes :id, :requester_id, :requestee_id, :buddy_type
  belongs_to :user
end
