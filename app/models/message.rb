class Message < ApplicationRecord
  belongs_to :user
  belongs_to :buddy
end
