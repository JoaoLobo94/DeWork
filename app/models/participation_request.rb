# == Schema Information
#
# Table name: participation_requests
#
#  id              :bigint           not null, primary key
#  accepted        :boolean
#  created_at      :datetime         not null
#  updated_at      :datetime         not null
#  company_id      :bigint
#  contribution_id :bigint
#  user_id         :bigint
#
# Indexes
#
#  index_participation_requests_on_company_id       (company_id)
#  index_participation_requests_on_contribution_id  (contribution_id)
#  index_participation_requests_on_user_id          (user_id)
#
# Foreign Keys
#
#  fk_rails_...  (company_id => companies.id)
#  fk_rails_...  (contribution_id => contributions.id)
#  fk_rails_...  (user_id => users.id)
#
class ParticipationRequest < ApplicationRecord
  belongs_to :user
  belongs_to :contribution
  belongs_to :company
end
