class Admin::UsersController < Admin::ApplicationController
	def index

	end

	def show
		@product_new = Product.new
	end
	def create
		@product_new = Product.save(product_params)
	end
		private
	def product_params
        params.require(:product).permit(:title, :image_id, :price, :label, :stock, :release, :introduction, :artist_id, :category_id)
   	end
end
