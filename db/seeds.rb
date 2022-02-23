# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#

#fix has many belongs to associations 
# Contribution.last.users
# Contribution.last.company
# Company.last.contributions
# Company.last.users
# Users.last.companies
# Users.last.contributions
user = User.new(
  email: 'admin@seed.xxx',
  password: '123456',
  password_confirmation: '123456',
  job: 'dev',
  wallet: 'q180fby4bcb03b7'
)
user.save!

company = Company.new(
  balance: 1.000001231234123,
  github: 'www.github.com',
  name: 'Sats',
  p_key: '0b2f789b7098f20b7298b27098',
  pub_key: 'q180fby4bcb03b7'
)

user.companies << company

contribution = Contribution.new(
  balance: 1.000001231234123,
  job_type: 'farmer',
  merged: true,
  pull_request: 'zabazaba',
  vote_balance: 1,
  company_id: 1
)

user.contributions << contribution