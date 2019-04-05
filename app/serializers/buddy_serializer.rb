class BuddySerializer < ActiveModel::Serializer
  attributes :id, :get_requester, :get_requestee, :buddy_type
  has_many :messages
end
