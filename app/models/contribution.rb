# == Schema Information
#
# Table name: contributions
#
#  id                      :bigint           not null, primary key
#  accepted_for_start      :boolean          default(FALSE)
#  aggregated_vote_amounts :json
#  creator                 :integer
#  current_value           :decimal(, )
#  description             :text
#  job_type                :string
#  merged                  :boolean          default(FALSE)
#  pull_request            :string
#  title                   :string
#  created_at              :datetime         not null
#  updated_at              :datetime         not null
#  company_id              :bigint
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
    updated_votes = aggregated_vote_amounts << vote_value
    update(aggregated_vote_amounts: updated_votes)
    number_of_votes = aggregated_vote_amounts.count
    if number_of_votes > 10
      one_quarter_of_votes = 0.25 * number_of_votes
      rounded_quarter_of_votes = one_quarter_of_votes.to_i
      sorted_votes = aggregated_vote_amounts.sort
      sorted_votes.shift(rounded_quarter_of_votes)
      sorted_votes.pop(rounded_quarter_of_votes)
      number_of_votes_for_mean = sorted_votes.count
      market_value = number_of_votes_for_mean.sum(0.0) / number_of_votes_for_mean.count
    else
      market_value = aggregated_vote_amounts.sum(0.0) / number_of_votes
    end
    update(current_value: market_value)
  end
end
