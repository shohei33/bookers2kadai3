class BooksController < ApplicationController

before_action :authenticate_user!

  def create
    @book = Book.new(book_params)
    @book.user_id = current_user.id
    if @book.save
      flash[:notice] = "successfully"
      redirect_to book_path(@book)
    else
      @user = User.find(current_user.id)
      flash[:errors] = @book.errors.full_messages
      redirect_to books_path(params[:id])
    end
  end

  def index
    @user = User.find(current_user.id)
    #to create book post
    @book = Book.new
    #To show all book posts
    @books = Book.all
  end

  def show
    #to show the book details
    @book = Book.new
    @detail_book = Book.find(params[:id])
    @user = @detail_book.user
  end

  def edit
    @book = Book.find(params[:id])
    if @book.user.id != current_user.id
      flash[:notice] = "You don't have the right to edit it"
      redirect_to books_path
    end
  end

  def update
    @book = Book.find(params[:id])
    @book.user_id = current_user.id
    if @book.update(book_params)
      flash[:notice] = "successfully"

      redirect_to book_path(@book)
    else
      flash[:errors] = @book.errors.full_messages
      render :edit
    end
  end

  def destroy
    book = Book.find(params[:id])
    book.destroy
    redirect_to books_path
  end

  private

  def book_params
    params.require(:book).permit(:title, :body)
  end
end