# == Schema Information
#
# Table name: companies
#
#  id         :bigint           not null, primary key
#  balance    :decimal(, )
#  github     :string
#  name       :string
#  owner      :integer
#  p_key      :string
#  pub_key    :string
#  wallet     :string
#  created_at :datetime         not null
#  updated_at :datetime         not null
#
# Indexes
#
#  index_companies_on_github   (github) UNIQUE
#  index_companies_on_name     (name) UNIQUE
#  index_companies_on_p_key    (p_key) UNIQUE
#  index_companies_on_pub_key  (pub_key) UNIQUE
#  index_companies_on_wallet   (wallet) UNIQUE
#
class CompanySerializer < ActiveModel::Serializer
  attributes :id, :name, :balance, :public_key
end
