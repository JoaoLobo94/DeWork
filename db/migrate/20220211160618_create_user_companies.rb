class CreateUserCompanies <ActiveRecord::Migration[6.1]
  def change
    create_table :user_companies do |t|
      t.references :company, index: true, foreign_key: true
      t.references :user, index: true, foreign_key: true
      t.timestamps
    end
  end
end
