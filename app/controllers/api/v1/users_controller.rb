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
end