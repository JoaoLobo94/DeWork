# == Schema Information
#
# Table name: contributions
#
#  id           :integer          not null, primary key
#  balance      :integer
#  merged       :boolean          default(FALSE)
#  pull_request :string           not null
#  type         :string           not null
#  vote_balance :integer
#  created_at   :datetime         not null
#  company_id   :integer          not null
#
# Foreign Keys
#
#  contributions_company_id_fkey  (company_id => companies.id)
#
class Contribution < ApplicationRecord
  belongs_to :company
  has_many :users, through: :user_contributions
  has_many :user_contributions
end
