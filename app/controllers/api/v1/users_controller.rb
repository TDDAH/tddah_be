class Api::V1::UsersController < ApplicationController

  # GET /api/v1/users
  def index
    users = User.all
    render json: UserSerializer.new(users)
  end

  # GET /api/v1/users/:id
  def show
    user = User.find(params[:id])
    render json: UserSerializer.new(user)
  end

  # POST /api/v1/users
  def create
    user = User.new(user_params)

    if user.save
      render json: user, status: :created
    else
      render json: user.errors, status: 401
    end
  end



  private

  def user_params
    params.require(:user).permit(:name, :email, :password, :password_confirmation)
  end
end