# == Schema Information
#
# Table name: user_contributions
#
#  id              :integer          not null, primary key
#  balance         :integer
#  contribution_id :integer          not null
#  user_id         :integer          not null
#
# Foreign Keys
#
#  user_contributions_contribution_id_fkey  (contribution_id => contributions.id)
#  user_contributions_user_id_fkey          (user_id => users.id)
#
class UserContribution < ApplicationRecord
  belongs_to :user
  belongs_to :contribution
end
