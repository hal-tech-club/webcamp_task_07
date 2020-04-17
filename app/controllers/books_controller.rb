class BooksController < ApplicationController
  # books controller下は認証ガード保護有
  before_action :authenticate_user!, :new_book
  before_action :correct_user, only: [:edit, :update]

  # newに当たる部分テンプレートはほぼ常時表示

  # Book登録
  def create
    book = Book.new(book_params)
    book.user_id = current_user.id
    book.save
    redirect_to book_path(book.id)
  end

  # Book一覧画面表示
  def index
    @books = Book.all
    @user = User.find(current_user.id)
  end

  # Book詳細画面表示
  def show
    @book = Book.find(params[:id])
    @user = User.find(@book.user.id)
  end

  # Book編集画面表示
  def edit
    @book = Book.find(params[:id])
  end

  # Book更新
  def update
    book = Book.find(params[:id])
    book.update(book_params)
    redirect_to book_path(book.id)
  end

  # Book削除
  def destroy
    book = Book.find(params[:id])
    book.destroy
    redirect_to books_path
  end

  protected

  def new_book
    @new_book = Book.new
  end

  def correct_user
    user = Book.find(params[:id]).user
    if current_user.id != user.id
      redirect_to books_path
    end
  end

  private

  def book_params
    params.require(:book).permit(:title, :body)
  end
end
