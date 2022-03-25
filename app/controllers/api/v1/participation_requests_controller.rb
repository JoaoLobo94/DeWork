class Api::V1::ParticipationRequestsController < ApplicationController
  def create
    @new_request = ParticipationRequest.new(contribution_id: participation_requests_params[:contribution_id],
                                            user_id: current_user.id, company_id: participation_requests_params[:company_id])
    @new_request.save!
    render json: @new_request
  end

  def index
    render json: ParticipationRequest.where(contribution_id: participation_requests_params[:contribution_id])
  end

  def accept_participation
    if Company.find(participation_requests_params[:company_id]).owner == current_user.id
      ParticipationRequest.find(participation_requests_params[:id]).update(accepted: accepted)
    end
    render :success
  end

  private

  def participation_requests_params
    params.permit(:contribution_id, :company_id, :accepted)
  end
end
