class User < ApplicationRecord
  has_secure_password
  validates :username, uniqueness: { case_sensitive: false }

  has_many :buddies, foreign_key: "requester_id", dependent: :destroy
  has_many :buddied, class_name: "Buddy", foreign_key: "requestee_id", dependent: :destroy
  
  def all_buddies
    self.buddies + self.buddied
  end
end
