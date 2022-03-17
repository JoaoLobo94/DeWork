class CreateCompanies <ActiveRecord::Migration[6.1]
  def change
    create_table :companies do |t|
      t.string :name
      t.string :github
      t.string :p_key
      t.integer :owner
      t.string :pub_key
      t.string :wallet
      t.decimal :balance

      t.timestamps
    end
    add_index :companies, :name, unique: true
    add_index :companies, :github, unique: true
    add_index :companies, :p_key, unique: true
    add_index :companies, :pub_key, unique: true
    add_index :companies, :wallet, unique: true
  end
end
