class Api::V1::Users::Repos::RepoAchievementsController < ApplicationController
  
  # GET /api/v1/users/:user_id/repos/:id/achievements
  def index
    
    # achievements = Achievements.all
    # render json: AchievementSerializer.new(achievements)
  end

  # POST /api/v1/users/:user_id/repos/:id/achievements
  def create
    # achievement = Achievement.new(achievement_params)

    # if achievement.save
    #   render json: achievement, status: :created
    # else
    #   render json: achievement.errors, status: :unauthorized
    # end
  end

  private

  # def achievement_params
  #   params.permit(:name, :criteria)
  # end
end