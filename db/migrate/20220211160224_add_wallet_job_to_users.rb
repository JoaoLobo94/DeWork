class AddWalletJobToUsers < ActiveRecord::Migration[7.0]
  def change
    add_column :users, :wallet, :string
    add_index :users, :wallet, unique: true
    add_column :users, :job, :string
  end
end
