class UsersController < ApplicationController
  before_filter :signed_in_user, only: [:edit, :update, :show]
  before_filter :correct_user, only: [:edit, :update, :show]
  def new
    @user = User.new
  end
  
  def show
    @user = User.find(params[:id])
  end
  
  def create
    @user = User.new(params[:user])
    if @user.save
      cookies[:remember_token] = @user.remember_token
      sign_in(@user)
      redirect_to root_url, notice: "Welcome to Home"
    else
      render 'new'
    end
  end
  
  def edit
    @reason = "profile"
  end
  
  def password
    @user = current_user
    @reason = "password"
  end
  
  def update
    if params[:commit] == "Change Password"
      @reason = "password"
    else
      @reason = "profile"
    end
    if @user.update_attributes(params[:user])
      cookies[:remember_token] = @user.remember_token
      sign_in @user
      if params[:commit] == "Change Password"
        flash[:notice] = "You have successfully changed your password."
      else
        flash[:notice] = "You have successfully updated your profile."
      end
      redirect_to user_path(@user)
    else
      render :edit
    end
  end
  
  private
     
     def correct_user
       @user = User.find(params[:id])
       redirect_to(root_path) unless current_user?(@user)
     end
  
  
end