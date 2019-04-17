class Api::V1::MessagesController < ApplicationController
  def create
    @message = Message.new(message_params)
    if @message.save
      message_cable(@message)
      render json: {
        success: true, object: @message, response_status: '200'
      }
    else
      render json: { success: false, response_status: '406' }
    end
  end

  private

  def message_params
    params.require(:message).permit(:user_id, :buddy_id, :content, :read)
  end

  def message_cable(message)
    ActionCable.server.broadcast(
      "message_channel_#{message.buddy_id}",
      content: message.content,
      id: message.id,
      username: message.user_name,
      buddy_id: message.buddy_id,
      read: message.read,
      created_at: message.created_at
    )
  end
end
