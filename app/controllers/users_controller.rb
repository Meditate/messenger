class UsersController < ApplicationController
  before_filter :set_params, only: [:show,:update,:destroy]
  before_filter :authenticate_user!

  def index
    @users=User.all
  end

  def show

  end

  def update
    if @user.upadate(secured_params)
      redirect_to users_path, :success => "Succesfully Updated"
    else
      redirect_to uesrs_path, :alert => "Unable to Update user"
    end
  end

  def destroy
    @user.destroy
    redirect_to users_path
  end

  private

  def set_params
    @user=User.find(params[:id])
  end

  def secured_params
    params.require(:user).permit(:role)
  end
end
