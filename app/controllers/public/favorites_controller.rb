class Public::FavoritesController < ApplicationController
    before_action :correct_user, only:[:index,:create,:destroy]

    def correct_user
      unless user_signed_in?
        redirect_to root_path
      end
    end

	def index
        @categories = Category.all.order(category_name: "ASC")
        @artists = Artist.all.order(artist_name: "ASC")
        @animes = Anime.all.order(anime_kana: "ASC")
        @userfavorites = current_user.favorites
        if @userfavorites.count > 0
        products = @userfavorites.pluck(:product_id)
        @favariteproducts = Product.where(id: products).order(release: "DESC")
        else redirect_to root_path
        end
	end
	def create
        product = Product.find(params[:product_id])
        favorite = current_user.favorites.new(product_id: product.id)
        favorite.save
        redirect_to product_path(product)
    end
    def destroy
        product = Product.find(params[:product_id])
        favorite = current_user.favorites.find_by(product_id: product.id)
        favorite.destroy
        redirect_to product_path(product)
    end
end
