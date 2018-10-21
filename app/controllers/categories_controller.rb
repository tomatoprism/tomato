class CategoriesController < ApplicationController
  before_action :correct_user, only:[:new, :create, :edit, :update, :destroy]

  def correct_user
      unless admin_signed_in?
        redirect_to root_path
      end
  end

  def new
    @category_new = Category.new
    @category = Category.all
  end

  def create
    @category_new = Category.new(category_params)
    @category_new.save(category_params)
    redirect_to new_category_path
  end

  def show
    @category = Category.find(params[:id])
    @categories = Category.all
    @artists = Artist.all
  end

  def edit
    @category_edit = Category.find(params[:id])
  end

  def update
    @category_edit = Category.find(params[:id])
    @category_edit.update(category_params)
    redirect_to new_category_path
  end

  def destroy
    category = Category.find(params[:id])
    category.destroy
    redirect_to new_category_path
  end

  private
  def category_params
    params.require(:category).permit(:category_name)
  end
end
