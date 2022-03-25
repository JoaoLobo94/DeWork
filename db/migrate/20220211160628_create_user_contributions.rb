class CreateUserContributions <ActiveRecord::Migration[6.1]
  def change
    create_table :user_contributions do |t|
      t.references :contribution, index: true, foreign_key: true
      t.references :user, index: true, foreign_key: true
      t.timestamps
    end
  end
end
