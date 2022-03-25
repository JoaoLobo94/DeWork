# == Schema Information
#
# Table name: contributions
#
#  id                 :bigint           not null, primary key
#  accepted_for_start :boolean          default(FALSE)
#  creator            :integer
#  current_value      :decimal(, )
#  job_type           :string
#  merged             :boolean          default(FALSE)
#  number_of_votes    :integer
#  pull_request       :string
#  created_at         :datetime         not null
#  updated_at         :datetime         not null
#  company_id         :bigint
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
  has_many :user_contributions
  has_many :replies
  has_many :users, through: :user_contributions


  def calculate_market_value(vote_value)
    if number_of_votes > 0
        #implement algorith
        #update()
    else
      update(vote_balance: vote_value) 
    end
  end
end
