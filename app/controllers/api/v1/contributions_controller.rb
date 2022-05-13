class Api::V1::ContributionsController < ApplicationController
  before_action :authenticate_user!
  before_action :set_contribution, only: %i[show update balance set_contribution accept_start_work_contribution accept_finished_contribution vote_on_value request_participation]
  before_action :set_company, only: %i[index create accept_finished_contribution]

  def index_user_contributions
    @user_contributions = Contribution.find(UserContribution.where(user_id: current_user.id).ids)
    render json: @user_contributions
  end

  def index
    render json: @company.contributions
  end

  def show
    render json: @contribution
  end

  def create
    @new_contribution = Contribution.new(contributions_params)
    @new_contribution.users << current_user
    @new_contribution.creator = current_user.id
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
      @contribution.save!
      render :success
    else
      render json: 'User not added'
    end
  end

  def accept_start_work_contribution
    return unless @contribution.company.owner.id == current_user.id

    @contribution.accepted_for_start = true
    @contribution.save!
    render :success
  end

  def accept_finished_contribution
    return unless @contribution.company.owner.id == current_user.id

    @contribution.merged = true
    @contribution.save!
    @company.bulk_funds_transfer(@contribution.current_value, @contribution.users)
    render :success
  end

  def vote_on_value
    return unless contributions_params[:value]

    @contribution.calculate_market_value(contributions_params[:value])
    render :success
  end

  private

  def contributions_params
    params.permit(:pull_request, :job_type, :company_id, :user_to_add,
                  :accept_start_work_contribution, :accept_finished_contribution, :value, :title, :description)
  end

  def set_company
    @company = Company.find(params[:company_id])
  end

  def set_contribution
    @contribution = Contribution.find(contributions_params[:id])
  end
end
