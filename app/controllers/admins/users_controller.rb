class Admins::UsersController < ApplicationController
  before_action :authenticate_admin!

  def index
    @users = User.page(params[:page]).per(10)
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
      flash[:notice] = "User info was successfully updated."
      redirect_to admins_user_path(@user)
    else
      flash[:alert] = "Could not update."
      render :edit
    end
  end

  private

  def user_params
    params.require(:user).permit(:name, :email, :profile_image, :is_deleted, :introduction)
  end

end
