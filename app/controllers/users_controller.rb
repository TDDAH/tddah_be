class Api::V1::UsersController < ApplicationRecord

  # GET /api/v1/users
  def index
    users = User.all
  end
end