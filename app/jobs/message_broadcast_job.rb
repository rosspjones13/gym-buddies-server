# class MessageBroadCastJob < ApplicationJob
#   queue_as :default
  
#   def perform(message)
#     byebug
#     payload = {
#       buddy_id: message.buddy.id,
#       content: message.content,
#       user_id: message.user.id
#     }
#     ActionCable.server.broadcast("messages#{message.buddy.id}", payload)
#   end
# end