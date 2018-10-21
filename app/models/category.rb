class Category < ApplicationRecord
	has_many :product_categories
  	has_many :products, through: :product_categories

  	validates_uniqueness_of :category_name
end
