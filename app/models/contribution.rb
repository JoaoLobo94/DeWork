class Contribution < ApplicationRecord
  belongs_to :company
  has_many :users, through: user_contributions
end
