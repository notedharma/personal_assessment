class CreateVotes < ActiveRecord::Migration[5.2]
  def change
    create_table :votes do |t|
      t.integer :rating

      t.belongs_to :user, index: true
      t.belongs_to :venue, index: true

      t.timestamps
    end
  end
end
