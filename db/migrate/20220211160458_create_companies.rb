class CreateCompanies <ActiveRecord::Migration[6.1]
  def change
    create_table :companies do |t|
      t.string :name
      t.string :github
      t.string :private_key
      t.string :public_key
      t.decimal :balance

      t.timestamps
    end
    add_index :companies, :name, unique: true
    add_index :companies, :github, unique: true
    add_index :companies, :private_key, unique: true
    add_index :companies, :public_key, unique: true
  end
end
