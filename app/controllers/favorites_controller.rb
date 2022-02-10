class FavoritesController < ApplicationController
  before_action:favorite_book
  
  def create
    favorite=current_user.favorites.new(book_id:@book.id)
    favorite.save
    redirect_to book_path(@book.id)
  end
  
  def destroy
    favorite=current_user.favorites.find_by(book_id:@book.id)
    favorite.destroy
    redirect_to book_path(@book.id)
  end
  
  private
  def favorite_book
    @book=Book.find(params[:book_id])
  end
end
