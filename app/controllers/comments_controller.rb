class CommentsController < ApplicationController
  before_action:find_book
  
  def create
    comment=current_user.comments.new(comment_params)
    comment.book_id=@book.id
    comment.save
    redirect_to book_path(@book.id)
  end
  
  private
  def comment_params
    params.require(:comment).permit(:comment)
  end
  
  def find_book
    @book=Book.find(params[:book_id])
  end
end
