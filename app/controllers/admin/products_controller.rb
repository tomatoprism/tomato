class Admin::ProductsController < Admin::ApplicationController
	def index
		@products = Product.all
	end

	def show
	end

	def edit
		@product = Product.find(params[:id])
	end

	def update
		@product = Product.find(params[:id])
		@product.update(product_params)
		redirect_to product_path(@product.id)
	end

	def destroy
		@product = Product.find(params[:id])
		@product.destroy
		redirect_to admin_products_path

	end

	def new
	end


	def create
		@product_new = Product.new(product_params)
		@product_new.save
		redirect_to admin_user_path(current_admin)
	end

	private
	def product_params
        params.require(:product).permit(:title, :image, :price, :label, :stock, :release, :introduction, :artist_id, category_ids: [], discs_attributes: [:id, :disc_name, :done, :_destroy,tracks_attributes: [:id, :music, :list_num]])
   	end
end





