# == Schema Information
#
# Table name: replies
#
#  id              :bigint           not null, primary key
#  body            :text
#  title           :string
#  created_at      :datetime         not null
#  updated_at      :datetime         not null
#  contribution_id :bigint
#  parent_id       :integer
#
# Indexes
#
#  index_replies_on_contribution_id  (contribution_id)
#
# Foreign Keys
#
#  fk_rails_...  (contribution_id => contributions.id)
#
class Reply < ApplicationRecord
  belongs_to :contribution
end
