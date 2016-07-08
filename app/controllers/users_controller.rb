class UsersController < ApplicationController
  before_filter :set_params, only: [:show,:update,:destroy]
  before_filter :authenticate_user!
  after_action :verify_authorized

  def index
    @users=User.order("role DESC").page(params[:page]).per(5)
    authorize User
  end

  def show

  end

  def update

    authorize @user

    if @user.update(secured_params)
      redirect_to users_path, :success => "Succesfully Updated"
    else
      redirect_to uesrs_path, :alert => "Unable to Update user"
    end
  end

  def destroy
    authorize @user

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

  def send_mail
    user=User.find_by_email('admin@example.com')
    email='aroundofyou@gmail.com'
    body = params[:body]
    UserMailer.user_email(user,email,body).deliver
    redirect_to users_path, notice: 'Message sent'
  end
end
