class CategoriesController < ApplicationController
  def new
  	@category_new = Category.new
  end

  def create
    @category_new = Category.new(category_params)
  	@category_new.save(category_params)
    redirect_to new_category_path
  end

  def update
  end

  def destroy
  end

  private
  def category_params
    params.require(:category).permit(:category_name)
  end
end
