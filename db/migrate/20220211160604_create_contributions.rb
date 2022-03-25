class CreateContributions <ActiveRecord::Migration[6.1]
  def change
    create_table :contributions do |t|
      t.string :pull_request
      t.string :job_type
      t.boolean :merged, default: false
      t.boolean :accepted_for_start, default: false
      t.integer :creator
      t.json :aggregated_vote_amounts, default: []
      t.decimal :current_value
      t.string :title
      t.text :description
      t.references :company, index: true, foreign_key: true

      t.timestamps
    end
  end
end
