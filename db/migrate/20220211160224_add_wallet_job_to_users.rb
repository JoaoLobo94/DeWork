class AddWalletJobToUsers <ActiveRecord::Migration[6.1]
  def change
    add_column :users, :wallet, :string
    add_column :users, :p_key, :string
    add_column :users, :pub_key, :string
    add_index :users, :wallet, unique: true
    add_index :users, :p_key, unique: true
    add_column :users, :job, :string
  end
end
