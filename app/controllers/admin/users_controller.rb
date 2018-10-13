class Admin::UsersController < Admin::ApplicationController
	def index

	end

	def show
		@product_new = Product.new
	end
	def create
		@product_new = Product.new(product_params)
		@product_new.save(product_params)
		redirect_to root_path
	end
	
	private
	def product_params
        params.require(:product).permit(:title, :image, :price, :label, :stock, :release, :introduction, :artist_id, :category_id)
   	end
end
