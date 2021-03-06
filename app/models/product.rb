class Product < ApplicationRecord
	belongs_to :artist
	belongs_to :anime

	has_many :product_categories
	has_many :categories, through: :product_categories
	has_many :reviews, dependent: :destroy

	has_many :cart_items, dependent: :destroy
	has_many :favorites, dependent: :destroy
	has_many :reviews, dependent: :destroy
	attachment :image

	has_many :discs, inverse_of: :product, dependent: :destroy

	accepts_nested_attributes_for :discs, reject_if: :all_blank, allow_destroy: true

	def self.search(search)
		if search
			Product.where(['title LIKE ?', "%#{search}%"])
		else
			Product.all
		end
	end

	def favorited_by?(user)
          favorites.where(user_id: user.id).exists?
    end

    validates_presence_of :stock
    validates_presence_of :title
    validates_presence_of :price
    validates_presence_of :image
end
