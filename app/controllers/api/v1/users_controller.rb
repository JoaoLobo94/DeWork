class Api::V1::UsersController < ApplicationController
  before_action :authenticate_user!

  def show
    @user = User.find_by(email: user_params[:user_email])
    render json: @user, serializer: UserSerializer
  end

  def create_transaction
    render json: current_user.transfer_funds(user_params['amount'], user_params['destination_wallet'])
  end

  def balance
    render json: current_user.get_balance
  end

  private

  def user_params
    params.permit(:amount, :destination_wallet, :user_email)
  end
end
