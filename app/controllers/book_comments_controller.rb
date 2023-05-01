class BookCommentsController < ApplicationController
   before_action :authenticate_user!
  before_action :ensure_correct_user, only: %i(destroy)
  def create
     comment = curernt_user.book_comemnts.new(post_comment_parms)
      unless book_comment.save
      comment.save
      redirect_to post_image_path(post_image)
      end
  end

  def destroy
      book_comment = BookComment.find(params[:id])
    book_comment.destroy
    @book_comments = Book.find(book_comment.book_id).book_comments
  end

   private

   def book_coments_parms
     parms.require(book_coments).permit(:comment)
   end
   def ensure_correct_user
  　@book=Book.find(params[:id])
  return if @book.user_id == current_user.id
    flash[:danger] = '権限がありません'
    redirect_to books_path

   end
end
