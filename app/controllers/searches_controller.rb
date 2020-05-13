class SearchesController < ApplicationController
  # users controller下は認証ガード保護有
  before_action :authenticate_user!, :find_login_user, :new_book

  def result
    method = params[:search_method]
    model = params[:search_model]
    word = params[:search_word]

    if model == "Book"
      @books = Book.search(method, word)
      render 'result_books'
    else
      @users = User.search(method, word)
      render 'result_users'
    end
  end

  protected

  def find_login_user
    @user = User.find(current_user.id)
  end

  def new_book
    @new_book = Book.new
  end
end
