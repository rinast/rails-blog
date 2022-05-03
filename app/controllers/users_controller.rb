class UsersController < ApplicationController
  before_action :set_user, only: [:show, :edit, :update]

  def show
  end

  def new
    @user = User.new
  end

  def index
    @users = User.paginate(page: params[:page], per_page: 5).page(params[:page]).order('created_at DESC')
  end

  def create
    @user = User.new(user_params)
    if @user.save 
      session[:user_id] = @user.id
      flash[:notice] = "Hi #{@user.username}, welcome to the blog."
      redirect_to @user
    else
      render "new"
    end
  end

  def edit
  end

  def update
    if @user.update(user_params)
      flash[:notice] = "User was updated successfully."
      redirect_to @user
    else
      render "edit"
    end
  end

  private

  def user_params
    params.require(:user).permit(:username, :email, :password)
  end

  def set_user
    @user = User.find(params[:id])
  end
end