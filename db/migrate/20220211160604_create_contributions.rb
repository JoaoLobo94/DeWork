class CreateContributions <ActiveRecord::Migration[6.1]
  def change
    create_table :contributions do |t|
      t.string :pull_request
      t.string :job_type
      t.boolean :accepted, default: false
      t.decimal :balance
      t.decimal :vote_balance
      t.references :company, index: true, foreign_key: true

      t.timestamps
    end
  end
end
