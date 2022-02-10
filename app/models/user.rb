class User < ApplicationRecord
  has_many :companies, through: :user_companies
  has_many :contributions, through: :user_contributions
end
