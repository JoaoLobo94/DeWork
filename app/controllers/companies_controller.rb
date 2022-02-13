class CompaniesController < ApplicationController
  before_action :authenticate_user! 

  def index
    @companies = Company.all
    render json: @companies, each_serializer: CompanySerializer
  end

  def show
    @company = Company.find(company_params[:id])
    render json: @company, serializer: CompanySerializer
  end

  def create
    @new_company = Company.new(company_params)
    @new_company << User.find
  end

  def update; end

  def destroy; end

  private

  def company_params
    params.permit(:id, :balance, :github, :name, :private_key, :public_key)
  end
end
