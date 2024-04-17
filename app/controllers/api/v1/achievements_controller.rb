class Api::V1::AchievementsController < ApplicationController
  
  # GET /api/v1/achievements
  def index
    achievements = Achievement.all
    render json: AchievementSerializer.new(achievements)
  end

  # POST /api/v1/achievements
  def create
    existing_achievement = Achievement.find_by(name: achievement_params[:name], criteria: achievement_params[:criteria])

    if existing_achievement
      render json: { error: "Achievement already in system" }, status: :bad_request
    else
      achievement = Achievement.new(achievement_params)

      if achievement.save
        render json: achievement, status: :created
      else
        render json: achievement.errors, status: :unprocessable_entity
      end
    end
  end

  private

  def achievement_params
    params.permit(:name, :criteria)
  end
end