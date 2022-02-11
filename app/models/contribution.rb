# == Schema Information
#
# Table name: contributions
#
#  id           :bigint           not null, primary key
#  balance      :decimal(, )
#  merged       :boolean          default(FALSE)
#  pull_request :string
#  type         :string
#  vote_balance :decimal(, )
#  created_at   :datetime         not null
#  updated_at   :datetime         not null
#  company_id   :bigint
#
# Indexes
#
#  index_contributions_on_company_id  (company_id)
#
# Foreign Keys
#
#  fk_rails_...  (company_id => companies.id)
#
class Contribution < ApplicationRecord
  belongs_to :company
  has_many :users, through: :user_contributions
  has_many :user_contributions
end
