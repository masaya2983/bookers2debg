class BookCommentsController < ApplicationController

  def create
    @book = Book.find(params[:book_id])
     comment = current_user.book_comemnts.new(book_comment_parms)
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


end
