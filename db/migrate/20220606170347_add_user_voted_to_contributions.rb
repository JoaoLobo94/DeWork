class AddUserVotedToContributions < ActiveRecord::Migration[6.1]
  def change
    add_column :contributions, :users_that_voted, :json, default: []
  end
end
