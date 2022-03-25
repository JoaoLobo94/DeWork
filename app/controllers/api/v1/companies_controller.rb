class Api::V1::CompaniesController < ApplicationController
  before_action :authenticate_user!, except: [:index]
  before_action :set_company, except: [:index, :create, :create_transaction]

  def index
    @companies = Company.all
    render json: @companies, each_serializer: CompanySerializer
  end

  def show
    render json: @company, serializer: CompanySerializer
  end

  def create
    @new_company = Company.new(company_params)
    @new_company.users << current_user
    @new_company.save!
    render json: @new_company, serializer: CompanySerializer
  end

  def update
    @company.update(company_params)
    render json: @company, serializer: CompanySerializer
  end

  def index_user_companies
    @user_companies = Company.find(UserCompany.where(user_id: current_user.id).ids)
    render json: @user_companies, each_serializer: CompanySerializer
  end

  def create_transaction
    @company.transfer_funds(user_params['amount'], user_params['destination_wallet'])
    render :success
  end

  def balance
    render json: @company.get_balance
  end

  private

  def company_params
    params.permit(:github, :name, :private_key, :amount, :destination_wallet, :description)
  end

  def set_company
    @company = Company.find(company_params[:id])
  end
end
