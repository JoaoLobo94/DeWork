# == Schema Information
#
# Table name: user_companies
#
#  id         :integer          not null, primary key
#  company_id :integer          not null
#  user_id    :integer          not null
#
# Foreign Keys
#
#  user_companies_company_id_fkey  (company_id => companies.id)
#  user_companies_user_id_fkey     (user_id => users.id)
#
class UserCompany < ApplicationRecord
  belongs_to :user
  belongs_to :company
end
