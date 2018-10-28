class Public::UsersController < Public::ApplicationController
	before_action :correct_user, only:[:edit, :update, :destroy, :show]

	def correct_user
		@user = User.find(params[:id])
		if @user == current_user
	    elsif admin_signed_in?
	    else  redirect_to root_path
	    end
  end

	def show
		@categories = Category.all
	    @artists = Artist.all
	    @animes = Anime.all
		@user = User.find(params[:id])
	end

	def edit
		@user = User.find(params[:id])
	end


	def update
		user = User.find(params[:id])
    	user.update(user_params)
    	redirect_to user_path(user), success: 'お客様情報が更新されました'
	end

	def destroy
    	@user = User.find(params[:id])
   	    @user.destroy
        redirect_to root_path, danger: '退会しました'
  	end

  	def post_update
	  if
	  	 @post_update = Post.find(params[:user][:address])
		 @user = current_user
		 @user.update(address:@post_update.post_address, post_code:@post_update.post_code)
		 redirect_to new_history_path
	  else
		 redirect_to new_history_path
	  end
	end

	private
    def user_params
        params.require(:user).permit(:name, :name_kana, :email, :phone, :post_code, :address)
    end

end
