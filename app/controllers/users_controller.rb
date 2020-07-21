class UsersController < ApplicationController
  before_action :set_user, only: [:edit, :update, :destroy]



  def new
    @user = User.new
  end


  def edit
  end

  def create
    @user = User.new(user_params)
      if @user.save
        session[:user_id] = @user.id
        redirect_to root_path, notice: 'Successfully created your account and logged in.' 
      else
        render :new
      end
  end


  def update
      if @user.update(user_params)
        
        redirect_to root_path, notice: 'Info successfully updated.' 
      else
        render :edit
      end
  end

  private
    def set_user
      @user = User.find(params[:id])
    end

    def user_params
      params.require(:user).permit(:email,:password,:role_id)
    end
end