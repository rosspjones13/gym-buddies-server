class BuddiesChannel < ApplicationCable::Channel
  # calls connect in client
  def subscribed
    stream_from "buddy_channel"
  end

  # calls disconnect in client
  def unsubscribed
    # Any cleanup needed when channel is unsubscribed
  end
end
