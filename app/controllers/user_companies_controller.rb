class UserCompaniesController < ApplicationController
  before_action :authenticate_user!

  def index
    @user_companies = UserCompanies.where(user_id: current_user.id)
  end
end
