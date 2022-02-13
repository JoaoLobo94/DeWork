class CompaniesController < ApplicationController
  before_action :authenticate_user!, except: [:index]

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
    @new_company.users << current_user
  end

  def update

  end

  private

  def company_params
    params.permit(:github, :name, :private_key)
  end
end
