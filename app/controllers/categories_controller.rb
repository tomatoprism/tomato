class CategoriesController < ApplicationController
  def new
  	@category_new = Category.new
  end

  def create
  	@category_new = Category.save(category_params)
  end

  def update
  end

  def destroy
  end

  private
  def category_params
    params.require(:category).permit(:name)
  end
end
