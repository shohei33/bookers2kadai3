class UsersController < ApplicationController

  before_action :authenticate_user!


  def edit
    @user = User.find(params[:id])
    if @user != current_user
      redirect_to user_path(current_user.id)
    end
  end

  def index
    @users = User.all
    @user = User.find(current_user.id)
    @book = Book.new
  end

  def show
    @user = User.find(params[ :id])
  	@books = @user.books
  	@book = Book.new
  end

  def update
  	@user = User.find(params[:id])
  	if @user.update(user_params)
   flash[:notice] = "successfully updated user!"
  		redirect_to user_path(@user)
  	else
  	  flash[:errors] = @user.errors.full_messages
  		render :edit
  	end
  end

private
  def user_params
  	params.require(:user).permit(:name, :introduction, :profile_image)
  end
end

  def baria_user
    unless params[:id].to_i == current_user.id
  	redirect_to user_path(current_user.id)
    end
  end