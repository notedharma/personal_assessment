class AddAvgRatingToVenues < ActiveRecord::Migration[5.2]
  def change
    add_column :venues, :avg_rating, :integer, :default => 1
  end
end
