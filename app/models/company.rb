# == Schema Information
#
# Table name: companies
#
#  id          :integer          not null, primary key
#  balance     :integer
#  github      :string           not null
#  name        :string           not null
#  private_key :string           not null
#  public_key  :string           not null
#  created_at  :datetime         not null
#
class Company < ApplicationRecord
  has_many :contributions
  has_many :users, through: :user_companies
end
