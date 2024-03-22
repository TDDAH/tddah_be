class Api::V1::UsersController < ApplicationController

  # GET /api/v1/users
  def index
    users = User.all
    render json: UserSerializer.new(users)
  end
  
end