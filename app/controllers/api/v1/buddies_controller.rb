class Api::V1::BuddiesController < ApplicationController    
  def create
    @buddy = Buddy.new(buddy_params)
    if @buddy.save
      buddy_cable(@buddy)
      render json: {
        success: true, object: @buddy, response_status: '200'
      }
    else
      render json: { success: false, response_status: '406' }
    end
  end

  def destroy
    @buddy = Buddy.find(params[:id])
    @buddy.destroy
  end

  def update
    @buddy = Buddy.find(params[:id]).update(buddy_params)
    render json: @buddy
  end

  private
  def buddy_params
    params.require(:buddy).permit(:requester_id, :requestee_id, :buddy_type)
  end

  def buddy_cable(buddy)
    ActionCable.server.broadcast(
      "buddy_channel_#{buddy.requestee_id}",
      id: buddy.id,
      requester_id: buddy.requester_id,
      requestee_id: buddy.requestee_id,
      buddy_type: buddy.buddy_type
    )
  end
end
