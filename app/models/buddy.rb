class Buddy < ApplicationRecord
  belongs_to :requester, class_name: "User", foreign_key: "requester_id"
  belongs_to :requestee, class_name: "User", foreign_key: "requestee_id"
  has_many :messages

  def get_requester
    {first_name: self.requester.first_name, last_name: self.requester.last_name, username: self.requester.username}
  end

  def get_requestee
    {first_name: self.requestee.first_name, last_name: self.requestee.last_name, username: self.requestee.username}
  end

  def formatted_messages
    self.messages.map do |message|
      message.formatted
    end
  end
end
