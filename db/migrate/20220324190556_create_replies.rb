class CreateReplies < ActiveRecord::Migration[6.1]
  def change
    create_table :replies do |t|
      t.string :title
      t.text :body
      t.integer :parent_id
      t.references :contribution, index: true, foreign_key: true

      t.timestamps
    end
  end
end
