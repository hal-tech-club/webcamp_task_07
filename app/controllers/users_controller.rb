class UsersController < ApplicationController
  # users controller下は認証ガード保護有
  before_action :authenticate_user!, :find_login_user

  def index
    @users = User.all
  end

  def show
    @user = User.find(params[:id])
  end

  def edit
    @user = User.find(params[:id])
  end

  protected

  def find_login_user
    @user = User.find(current_user.id)
  end
end
