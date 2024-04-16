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
    # If created through GitHub Oath
    if params[:user][:provider] && params[:user][:uid]
      user = User.find_or_initialize_by(provider: params[:user][:provider], uid: params[:user][:uid])
      user.assign_attributes(oauth_user_params)
      if user.new_record?
        random_password = SecureRandom.hex(10)
        user.password = random_password
        user.password_confirmation = random_password
      end
    else
      # If created through Sign Up
      user = User.new(user_params)
    end

    if user.save
      render json: user, status: :created
    else
      render json: user.errors, status: :unprocessable_entity
    end
  end

  # DELETE /api/v1/users/:id
  def destroy
    user = User.find(params[:id])
    user.destroy!
  end

  private

  def user_params
    params.require(:user).permit(:name, :email, :password, :password_confirmation)
  end

  def oauth_user_params
    params.require(:user).permit(:name, :email, :provider, :uid)
  end
end