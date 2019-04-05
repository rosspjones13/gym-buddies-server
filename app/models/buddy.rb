class Buddy < ApplicationRecord
  belongs_to :requester, class_name: "User", foreign_key: "requester_id"
  belongs_to :requestee, class_name: "User", foreign_key: "requestee_id"
  has_many :messages

  def get_requester
    self.requester
  end

  def get_requestee
    self.requestee
  end
end
