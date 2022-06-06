# == Schema Information
#
# Table name: companies
#
#  id          :bigint           not null, primary key
#  balance     :decimal(, )
#  description :text
#  github      :string
#  name        :string
#  owner       :integer
#  p_key       :string
#  pub_key     :string
#  wallet      :string
#  created_at  :datetime         not null
#  updated_at  :datetime         not null
#
# Indexes
#
#  index_companies_on_github   (github) UNIQUE
#  index_companies_on_name     (name) UNIQUE
#  index_companies_on_p_key    (p_key) UNIQUE
#  index_companies_on_pub_key  (pub_key) UNIQUE
#  index_companies_on_wallet   (wallet) UNIQUE
#
class Company < ApplicationRecord
  has_many :contributions
  has_many :user_companies
  has_many :participation_requests
  has_many :users, through: :user_companies
  after_create :new_wallet

  def new_wallet
    address_info = BlockcypherService.new.generate_address
    update(wallet: address_info['address'], p_key: address_info['private'], pub_key: address_info['public'])
  end

  def transfer_funds(amount, receiving_wallet)
    BlockcypherService.new.new_transaction(wallet, receiving_wallet, amount)
  end

  def get_balance
    balance = BlockcypherService.new.address_balance(wallet)
    update(balance: balance['final_balance'])
  end

  def bulk_funds_transfer(total_amount, receivers)
    return if total_amount.nil?

    amount_of_transfers = receivers.count
    amount_for_each = total_amount / amount_of_transfers

    receivers.each  do |receiver|
      transfer_funds(amount_for_each, receiver.wallet)
    end
  end
end
