class Api::V1::MessagesController < ApplicationController
  def create
    @message = Message.new(message_params)
    @buddy = Buddy.find(params[:message][:buddy_id])
    reciever_id = @buddy.requester_id == @message.user_id ? @buddy.requestee_id : @buddy.requester_id
    if @message.save
      message_cable(@message, reciever_id)
      message_user_cable(@message)
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

  def message_cable(message, reciever_id)
    ActionCable.server.broadcast(
      "message_channel_#{reciever_id}",
      content: message.content,
      id: message.id,
      username: message.user_name,
      buddy_id: message.buddy_id,
      read: message.read,
      created_at: message.created_at
    )
  end

  def message_user_cable(message)
    ActionCable.server.broadcast(
      "message_channel_#{message.user_id}",
      content: message.content,
      id: message.id,
      username: message.user_name,
      buddy_id: message.buddy_id,
      read: message.read,
      created_at: message.created_at
    )
  end
end
