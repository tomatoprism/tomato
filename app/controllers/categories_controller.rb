class CategoriesController < ApplicationController
  before_action :correct_user, only:[:new, :create, :edit, :update, :destroy]

  def correct_user
      unless admin_signed_in?
        redirect_to root_path
      end
  end

  def new
    @category_new = Category.new
    @categories = Category.all
  end

  def create
    @category_new = Category.new(category_params)

    if @category_new.save(category_params)
    redirect_to new_category_path, success: 'カテゴリが追加されました'
    else
      @categories = Category.all
      render 'new'
    end
  end

  def show
    @category = Category.find(params[:id])
    @products = @category.products.page(params[:page]).order(release: "DESC")
    @categories = Category.all.order(category_name: "ASC")
    @artists = Artist.all.order(artist_name: "ASC")
    @animes = Anime.all.order(anime_kana: "ASC")
  end

  def edit
    @category_edit = Category.find(params[:id])
  end

  def update
    @category_edit = Category.find(params[:id])

    if @category_edit.update(category_params)
       redirect_to new_category_path, success: 'カテゴリが編集されました'
    else
      render 'edit'
    end
  end

  def destroy
    category = Category.find(params[:id])
    category.destroy
    redirect_to new_category_path, success: 'カテゴリが削除されました'
  end

  private
  def category_params
    params.require(:category).permit(:category_name)
  end
end
