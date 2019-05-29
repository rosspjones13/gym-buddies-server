class Api::V1::MessagesController < ApplicationController
  def create
    @message = Message.new(message_params)
    @buddy = Buddy.find(params[:message][:buddy_id])
    reciever_id = @buddy.requester_id == @message.user_id ? @buddy.requestee_id : @buddy.requester_id
    if @message.save
      message_cable(reciever_id, @message.formatted)
      
      render json: {
        success: true, object: @message.formatted, response_status: '200'
      }
    else
      render json: { success: false, response_status: '406' }
    end
  end

  def update
    @message = Message.find(params[:id]).update(message_params)
    render json: @message
  end

  private

  def message_params
    params.require(:message).permit(:user_id, :buddy_id, :content, :read)
  end

  def message_cable(reciever_id, message)
    ActionCable.server.broadcast(
      "message_channel_#{reciever_id}",
      message: message
    )
  end
end
