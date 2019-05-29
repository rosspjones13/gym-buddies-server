class MessagesChannel < ApplicationCable::Channel
  def subscribed
    stream_from "message_channel_#{params[:user]}"
  end

  def unsubscribed
    # Any cleanup needed when channel is unsubscribed
  end
end
