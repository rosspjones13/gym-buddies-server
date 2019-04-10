class User < ApplicationRecord
  has_secure_password
  validates :username, uniqueness: { case_sensitive: false }

  has_many :buddies, foreign_key: "requester_id", dependent: :destroy
  has_many :buddied, class_name: "Buddy", foreign_key: "requestee_id", dependent: :destroy
  has_many :messages
  has_many :goals
  
  def all_buddies
    self.buddies + self.buddied
  end

  def user_messages
    self.all_buddies.map(buddy => buddy.messages)
  end

  # def all_buddy_names
  #   grab_buddies = []
  #   self.all_buddies.each do |buds|
  #     if (buds.requester != self)
  #       grab_buddies << buds.requester
  #     else
  #       grab_buddies << buds.requestee
  #     end
  #   end
  #   return grab_buddies
  # end
end
