class BooksController < ApplicationController
before_action :authenticate_user!
before_action :ensure_correct_user, only: [:edit, :update, :destroy]
  def show

    @book = Book.find(params[:id])
    @newbook = Book.new
   @users = User.all
   @user = @book.user
   @book_comment =BookComment.new

  end

  def index
    @books = Book.all
     @users = User.all
    @user = current_user
    @book = Book.new
  end

  def create
    @book = Book.new(book_params)
    @book.user_id = current_user.id
     @books = Book.all
      @user = @book.user
    if @book.save
      redirect_to book_path(@book.id)
      flash[:notice] ="You have created book successfully.."
    else
      render :index
    end
  end

  def edit
    @book = Book.find(params[:id])
     if @book.user == current_user
        render "edit"
     else
        redirect_to books_path
     end
  end

  def update
    @book = Book.find(params[:id])
    if @book.update(book_params)
      flash[:notice] ="You have created book successfully.."
      redirect_to book_path(@book.id)
    else
      @books=Book.all
      render "edit"
    end
  end

  def destroy
      book = Book.find(params[:id])  # データ（レコード）を1件取得
      book.destroy  # データ（レコード）を削除
      redirect_to books_path
  end

  private

  def book_params
    params.require(:book).permit(:title,:body)
  end

  def ensure_correct_user
    @book = Book.find(params[:id])
    unless@user = @book.user
    redirect_to(books_path) unless @user == current_user
    end
  end
end
