class UsersController < ApplicationController
  # before_action :require_logged_out, only: [:create, :new]

  def index
    @users = User.all

    render :index
  end

  def show
    @user = User.find(params[:id])

    if @user
      render :show
    else
      flash[:errors] = @user.errors.full_messages
      redirect_to users_url
    end
  end

  def new
    @user = User.new

    render :new
  end

  def create
    @user = User.new(user_params)

    if @user.save
      login(@user)

      redirect_to user_url(@user)
    else
      flash[:errors] = @user.errors.full_messages
      redirect_to new_session_url
    end
  end

  def update
    @user = User.find(params[:id])

    if @user.update_attributes(user_params)
      redirect_to user_url(@user)
    else
      flash[:errors] = @user.errors.full_messages
      redirect_to edit_user_url
    end
  end

  def edit
    @user = User.find(params[:id])
    render :edit
  end

  def destroy
    @user = User.find(params[:id])
    @user.destroy
    redirect_to users_url
  end

  private

  def user_params
    params.require(:user).permit(:email, :password)
  end
end
