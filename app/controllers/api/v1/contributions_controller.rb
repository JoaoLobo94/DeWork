class  Api::V1::ContributionsController < ApplicationController
  before_action :authenticate_user!
  def index_user_contributions
    @user_contributions = Contribution.find(UserContribution.where(user_id: current_user.id).ids)
    render json: @user_contributions
  end

  def index
    set_company 
    @company.contributions
  end

  def show
    @contribution = Contribution.find(contributions_params[:id])
    render json: @contribution
  end

  def create
    set_company
    @new_contribution = Contribution.new(contributions_params)
    @new_contribution.users << current_user
    @new_contribution.save!
    render json: @new_contribution
  end

  def update
    @contribution = Contribution.find(contributions_params[:id])
    @contribution.update(contributions_params)
    render json: @contribution
  end

  private

  def contributions_params
    params.permit(:pull_request, :job_type, :vote_balance, :company_id, :merged, :balance)
  end

  def set_company
    @company = Company.find(params[:company_id])
  end
end
