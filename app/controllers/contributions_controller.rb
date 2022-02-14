class ContributionsController < ApplicationController
before_action :authenticate_user!
  def index_user_contributions
    @user_contributions = Contribution.find(UserContribution.where(user_id: current_user.id).ids)
    render json: @user_contributions
  end

  def create
  end

  private

  def contributions_params
    params.permit(:pull_request, :type, :private_key)
  end
end
