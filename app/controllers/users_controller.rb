class UsersController < ApplicationController
  before_action :find_user, only: [:show, :edit, :update, :destroy]
  
  def index
    @users = User.all
  end

  def show; end
  
  def new
    @user = User.new
  end

  def create
    @user = User.new(user_params)
    if @user.save
      flash[:success] = "User Is Created"
      redirect_to root_path
    else
      render :new, status: :unprocessable_entity
    end
  end

  def edit; end

  def update
    if @user.update(post_params)
      flash[:success] = "User Is Updated"
      redirect_to root_path
    else
      render :edit, status: :unprocessable_entity
    end 
  end

  def destroy
    if @user.destroy
      flash[:success] = "User Is Deleted"
    else
      flash[:danger] = "User Is Not Deleted"
    end
    redirect_to root_path
  end

  private

  def user_params
    params.require(:user).permit(:name, :avatar)
  end

  def find_user
    @user = User.find(params[:id])
  end
end
