class Api::V1::UsersController < ApplicationController
  # GET /users/1
  def show
    if User.exists?(username: params[:id])
      @user = User.find_by(username: params[:id])
      render json: @user, status: :ok
    else
      render json: { message: 'Please enter correct username' }, status: :unprocessable_entity
    end
  end

  # POST /users
  def create
    @user = User.new(user_params)
    existing_user = User.find_by(username: @user.username)

    if existing_user
      render json: { message: 'User already exists' }, status: :unprocessable_entity
    elsif @user.save
      render json: @user, status: :created
    else
      render json: @user.errors, status: :unprocessable_entity
    end
  end

  private

  # Only allow a list of trusted parameters through.
  def user_params
    params.require(:user).permit(:username, :email)
  end
end
