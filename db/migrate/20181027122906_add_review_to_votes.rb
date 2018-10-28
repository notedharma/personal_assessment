class AddReviewToVotes < ActiveRecord::Migration[5.2]
  def change
    add_column :votes, :review, :string
  end
end
