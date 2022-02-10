class UsersController < ApplicationController
  def create
  end
  private

  def user_params
    params.require(:user).permit(:email, :name, :password, :email, :job, :mobile, access_levels_attributes: [:organization_type, :role_id, :organization_id])
  end
end
