class ChangeVotesFromCandidate < ActiveRecord::Migration[6.1]
  def change
    change_column :candidates, :votes, :integer, default: 0
  end
end
