class Message < ApplicationRecord
  belongs_to :user
  belongs_to :buddy

  def user_name
    {first_name: self.user.first_name, last_name: self.user.last_name, username: self.user.username}
  end

  def formatted
    {username: self.user_name, content: self.content, buddy_id: self.buddy_id, created_at: self.created_at}
  end
end
