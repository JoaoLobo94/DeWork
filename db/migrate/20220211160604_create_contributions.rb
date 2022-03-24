class CreateContributions <ActiveRecord::Migration[6.1]
  def change
    create_table :contributions do |t|
      t.string :pull_request
      t.string :job_type
      t.boolean :merged, default: false
      t.boolean :accepted_for_start, default: false
      t.integer :creator
      t.integer :number_of_votes
      t.decimal :vote_balance
      t.references :company, index: true, foreign_key: true

      t.timestamps
    end
  end
end
