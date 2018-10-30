class Vote < ApplicationRecord
	belongs_to :venue
	belongs_to :user
	# validates :venue_id, uniqueness: { scope: :user_id, message: "Can only vote once" }


end
