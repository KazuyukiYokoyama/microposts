class UsersController < ApplicationController
  before_action :set_user, only: [:show, :edit, :update]
  before_action :auth_user, only: [:edit, :update]

  def show
    @user = User.find(params[:id])
    @microposts = @user.microposts.order(created_at: :desc)
  end
  
  def new
    @user = User.new
  end
  
  def create
    @user = User.new(user_params)
    if @user.save
      flash[:success] = "Welcome to the Sample App!"
      redirect_to @user
    else
      render 'new'
    end
  end
  
  def edit
  end
  
  def update
    if @user.update(user_params)
      flash[:success] = "Success changed your Profile!"
      redirect_to @user
    else
      render 'edit'
    end
      
  end
  
  private
  
  def set_user
     @user = User.find(params[:id])
  end
  
  def auth_user
    if current_user != @user
      flash[:danger] = "Not your account"
      redirect_to root_url
    end
  end
  
  def user_params
    params.require(:user).permit(:name, :email, :introduction, :birthplace, :password, :password_confirmation)
  end
end
