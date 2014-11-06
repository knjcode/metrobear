class UsersController < ApplicationController
  #before_action :signed_in_user, only: [:index, :edit, :update, :destroy]
  #before_action :correct_user,   only: [:edit, :update]
  #before_action :admin_user,     only: :destroy
  before_action :authenticate

  def index
    @users = User.paginate(page: params[:page]).order('visiting_count DESC')
  end

  def show
    @user = User.find(params[:id])
  end

  def create
    @user = User.new(user_params)
    if @user.save
      sign_in @user
      flash[:success] = APP_NAME + "へようこそ！"
      redirect_to @user
    else
      render 'new'
    end
  end

  def retire
  end

  def destroy
    if current_user.destroy
      reset_session
      flash[:info] = '退会完了しました'
      redirect_to root_path
    else
      render :retire
    end
  end

end
