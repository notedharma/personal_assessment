class CreateVenues < ActiveRecord::Migration[5.2]
  def change
    create_table :venues do |t|
      t.string :name
      t.string :category
      t.string :price
      t.string :description
      t.string :address
      t.float :longitude
      t.float :latitude
      t.string :contact
      t.integer :phone

      t.belongs_to :user, index: true
      t.timestamps

    end

    add_column :users, :status, :integer, :default => 0

  end
end
