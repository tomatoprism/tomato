class Artist < ApplicationRecord
	has_many :products

	validates_uniqueness_of :artist_name
end
