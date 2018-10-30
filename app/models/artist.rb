class Artist < ApplicationRecord
	has_many :products, dependent: :destroy

	validates_uniqueness_of :artist_name
    validates_presence_of :artist_name

    def self.search(search)
		if search
			Artist.where(['artist_name LIKE ?', "%#{search}%"])
		else
			Artist.all
		end
	end
end
