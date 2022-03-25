class CreateParticipationRequests < ActiveRecord::Migration[6.1]
  def change
    create_table :participation_requests do |t|
      t.references :contribution, index: true, foreign_key: true
      t.references :user, index: true, foreign_key: true
      t.boolean :accepted
      t.timestamps
    end
  end
end
