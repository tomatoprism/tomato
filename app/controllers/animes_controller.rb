class AnimesController < ApplicationController
before_action :correct_user, only:[:new, :create, :edit, :update, :destroy]

  def correct_user
      unless admin_signed_in?
        redirect_to root_path
      end
  end

  def index
    @anime_new = Anime.new
    @animes = Anime.all
  end

  def create
    @anime_new = Anime.new(anime_params)

    if @anime_new.save(anime_params)
    redirect_to animes_path, success: 'アニメタイトルが追加されました'
    else
      @animes = Anime.all
      render 'index'
    end
  end
  
  def show
    @anime = Anime.find(params[:id])
    @products = @anime.products.page(params[:page]).order(release: "DESC")
    @categories = Category.all.order(category_name: "ASC")
    @artists = Artist.all.order(artist_name: "ASC")
    @animes = Anime.all.order(anime_kana: "ASC")
  end

  def edit
    @anime_edit = Anime.find(params[:id])
  end

  def update
    @anime_edit = Anime.find(params[:id])

    if @anime_edit.update(anime_params)
       redirect_to animes_path, success: 'アニメタイトルが編集されました'
    else
      render 'edit'
    end
  end

  def destroy
    anime = Anime.find(params[:id])
    anime.destroy
    redirect_to animes_path, success: 'アニメタイトルが削除されました'
  end

  private
  def anime_params
    params.require(:anime).permit(:anime_name, :anime_kana, :logo)
  end
end
