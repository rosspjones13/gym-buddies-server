class Buddy < ApplicationRecord
  belongs_to :requester, class_name: "User", foreign_key: "requester_id"
  belongs_to :requestee, class_name: "User", foreign_key: "requestee_id"
  has_many :messages

  def get_requester
    {id: self.requester.id, first_name: self.requester.first_name, last_name: self.requester.last_name, username: self.requester.username, status: self.requester.status}
  end

  def get_requestee
    {id: self.requestee.id, first_name: self.requestee.first_name, last_name: self.requestee.last_name, username: self.requestee.username, status: self.requestee.status}
  end

  def formatted_messages
    sorted = self.messages.sort_by {|message| message.created_at}
    sorted.map do |message|
      message.formatted
    end
  end
end
