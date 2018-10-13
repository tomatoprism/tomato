class Admin::ProductsController < Admin::ApplicationController
	def index

	end

	def show

	end

	def edit

	end

	def update

	end

	def destroy

	end

	def new
		
	end


	def create
		@product_new = Product.new(product_params)
		@product_new.save(product_params)
		redirect_to admin_user_path(current_admin)
	end
	private
	def product_params
        params.require(:product).permit(:title, :image, :price, :label, :stock, :release, :introduction, :artist_id, :category_id, discs_attributes: [:id, :disc_name, :done, :_destroy,tracks_attributes: [:id, :music, :list_num]])
   	end
end




