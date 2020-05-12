class BookCommentsController < ApplicationController
  before_action :correct_user, only: [:destroy]

  def create
    book = Book.find(params[:book_id])
    comment = current_user.book_comments.new(book_comment_params)
    comment.book_id = book.id
    comment.save
    redirect_to book_path(book)
  end

  def destroy
    book = Book.find(params[:book_id])
    comment = current_user.book_comments.find_by(book_id: book.id)
    comment.destroy
    redirect_to book_path(book)
  end

  protected

  def correct_user
    user = BookComment.find_by(book_id: params[:book_id]).user
    if current_user.id != user.id
      redirect_to books_path
    end
  end

  private

  def book_comment_params
    params.require(:book_comment).permit(:user_id, :book_id, :comment)
  end
end
