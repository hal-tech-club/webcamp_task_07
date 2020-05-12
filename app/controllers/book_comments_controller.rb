class BookCommentsController < ApplicationController
  def create

  end

  private

  def book_comment_params
    params.require(:book_comment).permit(:user_id, :book_id, :comment)
  end
end
