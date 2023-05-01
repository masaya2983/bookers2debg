class FavoritesController < ApplicationController
  before_action :authenticate_user!
  before_action :set_book

  def create
    book = Book.find(params[:book_id])
    favorite = current_user.favorites.new(user_id: current_user.id)
    favorite.save
    redirect_to book_path(book)
  end

  def destroy
    book = Book.find(params[:book_id])
    favorite = current_user.favorites.find_by(post_image_id: post_image.id)
    favorite.destroy
    redirect_to book_path(book)
  end
   private

  def book_params
      @book= Book.find(params[:book_id])
  end


end
