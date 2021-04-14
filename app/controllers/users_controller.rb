class UsersController < ApplicationController

  def index
    @users = User.all
  end

  def new
    @user = User.new
  end

  def create
    @user = User.new(user_params)
    if @user.save
      flash[:success] = "Saved successfully!"   
      redirect_to login_url
    else
      flash[:danger] = "Invalid content. Try again."
      render 'new'
    end
  end

  def show
    @user = User.find(params[:id])
  end

  def edit
    @user = User.find(params[:id])
  end 

  def update
    @user = User.find(params[:id])
    if @user.update_atributes(user_params)
      flash[:success] = "Saved successfully!"
      redirect_to @user
    else
      flash[:danger] = "Invalid content. Try again."
      render 'edit'  
    end  
  end  

  def destroy
    User.find(params[:id]).destroy
    redirect_to users_url
  end 

  private

  def user_params
    params.require(:user).permit(:name, :email, :password, :password_confirmation)
  end

  def correct_user
    @user = User.find(params[:id])
    # go to HOME PAGE
    # UNLESS
    # current user? -> ID of this user
    # is the same as the ID of the user being checked
    redirect_to(root_url) unless current_user?(@user)
  end
  
end
