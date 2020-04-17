class UsersController < ApplicationController
  # users controller下は認証ガード保護有
  before_action :authenticate_user!, :find_login_user, :new_book
  before_action :correct_user, only: [:edit, :update]

  def index
    @users = User.all
  end

  def show
    @user = User.find(params[:id])
  end

  def edit
    @user = User.find(params[:id])
  end

  def update
    user = User.find(params[:id])
    user.update(user_params)
    redirect_to user_path(user.id)
  end

  protected

  def find_login_user
    @user = User.find(current_user.id)
  end

  def new_book
    @new_book = Book.new
  end

  def correct_user
    user = User.find(params[:id])
    if current_user.id != user.id
      redirect_to user_path(current_user.id)
    end
  end

  private

  def user_params
    params.require(:user).permit(:name, :profile_image, :introduction)
  end
end
