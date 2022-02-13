# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
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
  private_key: '0b2f789b7098f20b7298b27098',
  public_key: 'q180fby4bcb03b7'
)
company.save!
