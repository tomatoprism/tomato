class Product < ApplicationRecord
	belongs_to :category
	belongs_to :artist

	has_many :discs
	has_many :reviews
	has_many :cart_items
	attachment :image
end
