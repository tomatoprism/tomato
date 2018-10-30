class Category < ApplicationRecord
	has_many :product_categories
  	has_many :products, through: :product_categories, dependent: :destroy

  	validates_uniqueness_of :category_name
	validates_presence_of :category_name

	def self.search(search)
		if search
			Category.where(['category_name LIKE ?', "%#{search}%"])
		else
			Category.all
		end
	end
end
