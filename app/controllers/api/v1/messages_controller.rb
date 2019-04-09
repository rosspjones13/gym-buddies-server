class Api::V1::MessagesController < ApplicationController
  def index
    render json: Message.all
  end

  def create
    @message = Message.new(message_params)
    if @message.save
      message_cable(@message)
      render json: {
        success: true, object: @message, response_status: success_response
      }
    else
      render json: { success: false, response_status: error_response }
    end
  end

  private

  def message_params
    params.require(:message).permit(:user_id, :buddy_id, :content)
  end

  def message_cable(message)
    ActionCable.server.broadcast(
      "message_channel_#{message.buddy_id}",
      content: message.content,
      id: message.id,
      user_id: message.user_id,
      buddy_id: message.buddy_id
    )
  end
end
