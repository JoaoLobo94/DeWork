# == Schema Information
#
# Table name: user_contributions
#
#  id              :bigint           not null, primary key
#  created_at      :datetime         not null
#  updated_at      :datetime         not null
#  contribution_id :bigint
#  user_id         :bigint
#
# Indexes
#
#  index_user_contributions_on_contribution_id  (contribution_id)
#  index_user_contributions_on_user_id          (user_id)
#
# Foreign Keys
#
#  fk_rails_...  (contribution_id => contributions.id)
#  fk_rails_...  (user_id => users.id)
#
class UserContribution < ApplicationRecord
  belongs_to :user
  belongs_to :contribution
end
