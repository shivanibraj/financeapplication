class UsersController < ApplicationController
  before_action :current_user, only: [:show, :edit, :update, :destroy]

  def index
      @users =User.all
    end
    
  

  def show
  end

  def new
    @user= User.new
  end

  def edit
  end

  def create
    @user = User.new(user_params)
   
    if @user.save
      redirect_to @user, notice: "New user created successfully."
    else
      render :new
    end
  end

  def update
    if @user.update(user_params)
      redirect_to user_path(@user)
    else
      render :edit
    end
  end
  

  def destroy
    @user = User.find(params[:id])
    @user.destroy

    redirect_to users_path
  end

  private
    def user_params
      params.require(:user).permit(:name, :email, :balance)
    end 

    def current_user
      @user = User.find(params[:id])
    end
end
