# == Schema Information
#
# Table name: companies
#
#  id          :bigint           not null, primary key
#  balance     :decimal(, )
#  github      :string
#  name        :string
#  private_key :string
#  public_key  :string
#  created_at  :datetime         not null
#  updated_at  :datetime         not null
#
# Indexes
#
#  index_companies_on_github       (github) UNIQUE
#  index_companies_on_name         (name) UNIQUE
#  index_companies_on_private_key  (private_key) UNIQUE
#  index_companies_on_public_key   (public_key) UNIQUE
#
class Company < ApplicationRecord
  has_many :contributions
  has_many :user_companies
  has_many :users, through: :user_companies
end
