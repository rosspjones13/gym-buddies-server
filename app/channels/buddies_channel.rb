class BuddiesChannel < ApplicationCable::Channel
  # calls connect in client
  def subscribed
    stream_from 'location_user_' + current_user.id.to_s
  end

  # calls disconnect in client
  def unsubscribed
    # Any cleanup needed when channel is unsubscribed
  end
  
  # called when send is called in client
  def receive(params)
    print params[:data]
  end
  
  # called when perform is called in client
  # def method_name(params)
  #   print params[:data]
  # end
end
