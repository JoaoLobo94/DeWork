class Company < ApplicationRecord
  has_many :contributions
  has_many :users, through: :user_companies
end
