class Api::V1::UsersController < ApplicationController
  before_action :authenticate_user!

  def create_transaction
    current_user.transfer_funds(user_params['amount'], user_params['destination_wallet'])
    render :success
  end

  def balance
    render json: current_user.get_balance
  end

  private

  def user_params
    params.permit(:amount, :destination_wallet)
  end
end
