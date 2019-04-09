class BuddiesChannel < ApplicationCable::Channel
  # calls connect in client
  def subscribed
    stream_from "buddies_channel_ #{params[:user]}"
  end

  # calls disconnect in client
  def unsubscribed
    # Any cleanup needed when channel is unsubscribed
  end
end
