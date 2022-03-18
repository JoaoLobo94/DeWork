class Api::V1::ContributionsController < ApplicationController
  before_action :authenticate_user!
  before_action :set_contribution, only: %i[show update balance set_contribution]

  def index_user_contributions
    @user_contributions = Contribution.find(UserContribution.where(user_id: current_user.id).ids)
    render json: @user_contributions
  end

  def index
    set_company
    @company.contributions
  end

  def show
    render json: @contribution
  end

  def create
    set_company
    @new_contribution = Contribution.new(contributions_params)
    @new_contribution.users << current_user
    @new_contribution.creator = current_user
    @new_contribution.save!
    render json: @new_contribution
  end

  def update
    @contribution.update(contributions_params)
    render json: @contribution
  end

  def balance
    render json: @contribution.balance
  end

  def add_user_to_contribution
    if current_user.id == @contribution.creator
      @contribution.users << user_to_add
      render :success
    else
      render json: 'User not added'
    end
  end

  private

  def contributions_params
    params.permit(:pull_request, :job_type, :vote_balance, :company_id, :merged, :balance, :user_to_add)
  end

  def set_company
    @company = Company.find(params[:company_id])
  end

  def set_contribution
    @contribution = Contribution.find(contributions_params[:id])
  end
end
