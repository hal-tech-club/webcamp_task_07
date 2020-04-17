class BooksController < ApplicationController
  # books controller下は認証ガード保護有
  before_action :authenticate_user!, :new_book

  # newに当たる部分テンプレートはほぼ常時表示

  # Book登録
  def create
    @new_book = Book.new(book_params)
    @new_book.user_id = current_user.id
    if @new_book.save
      flash[:success] = 'Book was successfully created'
      redirect_to book_path(@new_book.id)
    else
      @books = Book.all
      @user = User.find(current_user.id)
      render action: :index
    end
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
    @book = Book.find(params[:id])
    if @book.update(book_params)
      flash[:success] = 'Book was successfully updated'
      redirect_to book_path(@book.id)
    else
      render action: :edit
    end
  end

  # Book削除
  def destroy
    book = Book.find(params[:id])
    book.destroy
    flash[:success] = 'Book was successfully destroyed.'
    redirect_to books_path
  end

  protected

  def new_book
    @new_book = Book.new
  end

  private

  def book_params
    params.require(:book).permit(:title, :body)
  end
end
