class Admins::UsersController < ApplicationController

  def index
    @user = User.page(params[:page]).per(10)
    @posts = User.all.post(:id)
  end

  def show
    @user = User.find(params[:id])
  end

  def edit
    @user = User.find(params[:id])
  end

  def update
    @user = User.find(params[:id])
    if @user.update(user_params)
      flash[:notice]="User's info was successfully updated."
      redirect_to admins_user_path(@user)
    end
  end

  private

  def user_params
    params.require(:user).permit(:name, :email, :profile_image, :introduction, :is_deleted)
  end

end
