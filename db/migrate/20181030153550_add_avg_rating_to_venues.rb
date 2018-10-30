class AddAvgRatingToVenues < ActiveRecord::Migration[5.2]
  def change
    add_column :venues, :avg_rating, :integer, :default => 0
  end
end
