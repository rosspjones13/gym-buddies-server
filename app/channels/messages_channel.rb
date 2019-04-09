class MessagesChannel < ApplicationCable::Channel
  def subscribed
    # if params[:buddy]
      stream_from "message_channel_#{params[:buddy]}"
    # end
  end

  def unsubscribed
    # Any cleanup needed when channel is unsubscribed
  end
end
