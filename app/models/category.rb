class Category < ApplicationRecord
	has_many :product_categories
  	has_many :products, through: :drink_users

end
