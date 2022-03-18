class BlockcypherService
  attr_reader :node_connection

  MAX_ATTEMPTS = 2

  def initialize
    @node_connection = BlockCypher::Api.new(api_token: ENV['BLOCKCYPHER_API'], network: ENV['NETWORK'],
                                            currency: ENV['CURRENCY'])
  end

  def generate_address
    @node_connection.address_generate
  end

  def dev_add_test_balance(address, amount)
    @node_connection.faucet(address, amount)
  end

  def address_balance(address)
    @node_connection.address_balance(address)
  end

  def generate_new_wallet_with_address(name, address)
    @node_connection.wallet_create(name, address)
  end

  def get_wallet_by_name(name)
    @node_connection.wallet_get(name)
  end

  def add_address_to_wallet(name, address)
    @node_connection.wallet_add_addr(name, address)
  end

  def delete_address_from_wallet(name, address)
    @node_connection.wallet_delete_addr(name, address)
  end

  def add_to_wallet_without_address(name)
    @node_connection.wallet_gen_addr(name)
  end

  def delete_wallet(name)
    @node_connection.wallet_delete(name)
  end

  def new_transaction(sending_address, receiving_address, amount)
    @node_connection.transaction_new(sending_address, receiving_address, amount)
  end

  def transaction_status(txid)
    @node_connection.blockchain_transaction(txid)
  end
end
