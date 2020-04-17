class UsersController < ApplicationController
  # users controller下は認証ガード保護有
  before_action :authenticate_user!, :find_login_user, :new_book

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
    @user = User.find(params[:id])
    if @user.update(user_params)
      flash[:success] = 'User was successfully updated'
      redirect_to user_path(@user.id)
    else
      render action: :edit
    end
  end

  protected

  def find_login_user
    @user = User.find(current_user.id)
  end

  def new_book
    @new_book = Book.new
  end

  private

  def user_params
    params.require(:user).permit(:name, :profile_image, :introduction)
  end
end
