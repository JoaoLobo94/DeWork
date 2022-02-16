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
    @new_company.save!
    render json: @new_company, serializer: CompanySerializer
  end

  def update
    @company = Company.find(company_params[:id])
    @company.update(company_params)
    render json: @company, serializer: CompanySerializer
  end

  def index_user_companies
    @user_companies = Company.find(UserCompany.where(user_id: current_user.id).ids)
    render json: @user_companies, each_serializer: CompanySerializer
  end

  private

  def company_params
    params.permit(:github, :name, :private_key)
  end
end
