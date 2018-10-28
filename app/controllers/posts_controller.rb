class PostsController < ApplicationController
  before_action :correct_user

  def correct_user
      unless user_signed_in? || admin_signed_in?
        redirect_to root_path
      end
  end

  def new
  	@post = Post.new
  end

  def create
  	post = Post.new(post_params)
    post.user_id = current_user.id
    if post.save
       redirect_to user_path(current_user.id), success: 'お届け先が登録されました'
    else
       render :new
    end
  end

  def edit
  	@post = Post.find(params[:id])

  end

  def update
  	post = Post.find(params[:id])
    post.update(post_params)
    redirect_to user_path(post.user_id), success: 'お届け先が更新されました'
  end

  def destroy
  end

  private
    def post_params
        params.require(:post).permit(:post_address, :post_code, :post_code, :postage_id, :prefecture_id)
    end
end
