class UsersController < ApplicationController
  def after_update_path_for(resource)
    user_path(resource)
  end
  def index
    @users =User.all
  end
  
  def show
    @user = User.find(params[:id])
    @book = Book.new
  end
  
  def edit
    @user = User.find(params[:id])
  end
  
  def update
    @user = User.find(params[:id])
    @user.update(user_params)
    redirect_to user_path(@user.id)  
  end

  private
  def user_params
    params.require(:user).permit(:name, :introduction, :profile_image)
  end
  
end
