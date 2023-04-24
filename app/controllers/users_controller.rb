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
      redirect_to root_path
    else
      render :new, status: :unprocessable_entity
    end
  end

  def edit; end

  def update
    if @user.update(post_params)
      redirect_to root_path
    else
      render :edit, status: :unprocessable_entity
    end 
  end

  def destroy
    @user.delete
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
