class Api::V1::AchievementsController < ApplicationController
  
  def index
    user = User.find(params[:user_id])
    achievements = user.achievements
    render json: AchievementSerializer.new(achievements)
  end

end