class Api::V1::UsersController < ApplicationController
  before_action :authenticate_user!

  def create_transaction
    current_user.transfer_funds(user_params['amount'], user_params['destination_wallet'])
  end

  private

  def user_params
    params.permit(:amount, :destination_wallet)
  end
end
