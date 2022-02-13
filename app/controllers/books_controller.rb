class BooksController < ApplicationController
  before_action:authenticate_user!
  
  def index
    @book=Book.new
    @books=Book.all
  end
  
  def create
    Book.create(book_params)
    redirect_to root_path
  end
  def destroy
    book=Book.find(params[:id])
    book.destroy
    redirect_to root_path
  end
  
  def show
    @book=Book.find(params[:id])
    @comment=Comment.new
  end
  
  private
  def book_params
    params.require(:book).permit(:title,:body,:image,:user_id)
  end
end
