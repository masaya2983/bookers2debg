class BookCommentsController < ApplicationController

  def create
    book = Book.find(params[:book_id])
     　comment = current_user.book_comemnts.new(book_comment_params)
     　comment.book_id = book.id
      comment.save
      redirect_to request.referer
　end


  def destroy
       BookComment.find_by(id: params[:id], book_id: params[:book_id]).destroy
   redirect_to request.referer
  end

   private

   def book_coments_params
     parms.require(book_coments).permit(:comment)
   end
  end
end