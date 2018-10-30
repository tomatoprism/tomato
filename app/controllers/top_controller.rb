class TopController < ApplicationController
	def top
		@categories = Category.all(category_name: "ASC")
		@artists = Artist.all(artist_name: "ASC")
		@animes = Anime.all(anime_kana: "ASC")
		@productfind = Product.search(params[:search])
		productsort = Product.order(release: "DESC")
		@products = productsort.limit(8)
		@ranking = Product.find(Favorite.group(:product_id).order('count(product_id) desc').limit(3).pluck(:product_id))



		# @rank = Note.find(Like.group(:note_id).order('count(note_id) desc').limit(5).pluck(:note_id))
	end
	def admin
	end
	private
	def product_params
        params.require(:product).permit(:title, :image_id, :price, :label, :stock, :release, :introduction, :artist_id, :category_id)
    end
end
