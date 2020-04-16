class UsersController < ApplicationController
  def index
    @users = User.all
  end

  def show
    @user = User.find(paramas[:id])
  end

  def edit
    @user = User.find(paramas[:id])
  end
end
