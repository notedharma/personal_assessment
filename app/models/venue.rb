class Venue < ApplicationRecord
	include Filterable
	belongs_to :user
  has_many :votes

	reverse_geocoded_by :latitude, :longitude,
          :address => :address
          after_validation :reverse_geocode



end
