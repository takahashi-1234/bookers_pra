class BooksController < ApplicationController
  before_action:authenticate_user!
  
  def index
    @book=Book.new
    @books=Book.all
  end
  
  def create
    Book.create(book_params)
    redirect_to books_path
  end
  
  private
  def book_params
    params.require(:book).permit(:title,:body,:image,:user_id)
  end
end
