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

  def send_mail
    authorize User
    @users=User.all
    @users.each do |r|
      @email=r.email
      UserMailer.user_email(@email,params[:email]).deliver
    end
    redirect_to users_path
  end

  def create
    authorize User
    @user=User.new(secured_params)
    if @user.save
      redirect_to users_path, notice: "User succesfully created"
    else
      redirect_to users_path, notice: "User wasnt created"
    end

  end

  private

  def set_params
    @user=User.find(params[:id])
  end

  def secured_params
    params.require(:user).permit(:email,:password,:role)
  end


end
