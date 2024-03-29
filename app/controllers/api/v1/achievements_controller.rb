class Api::V1::AchievementsController < ApplicationController
  
  # GET /api/v1/users/:user_id/achievements
  def index
    user = User.find(params[:user_id])
    achievements = user.achievements
    render json: AchievementSerializer.new(achievements)
  end

  # POST /api/v1/users/:user_id/achievements
  def create
    user = User.find(params[:user_id])
    achievement = user.achievements.new(achievement_params)

    if achievement.save
      render json: achievement, status: :created
    else
      render json: achievement.errors, status: :unauthorized
    end
  end


  private

  def achievement_params
    params.permit(:name, :criteria)
  end
end