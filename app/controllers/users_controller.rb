class UsersController < ApplicationController
  def create
    new_user = User.new(user_params)
    new_user.save
  end

  private

  def user_params
    params.permit(:email, :name, :password, :job, :wallet_id)
  end
end
