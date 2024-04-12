require "rails_helper"

RSpec.describe "Api::V1::Users::Repos::RepoAchievements", type: :request do

  before(:each) do
    @user = User.create!(name: "snash", email: "turing@example.com", password: "ott123", password_confirmation: "ott123")  
    @repo = @user.repos.create!(owner: "s2an", name: "lunch_and_learn_be_7")
    @achievement = Achievement.create!(name: "SimpleCov Pro", criteria: "SimpleCov coverage achieves over 95%")
    @repo_achievement = RepoAchievement.create!(repo_id: @repo.id, achievement_id: @achievement.id)
    # @achievement2 = Achievement.create!(name: "SimpleCov Wizard", criteria: "SimpleCov coverage achieves 100%")
    # @achievement3 = Achievement.create!(name: "SimpleCov Novice", criteria: "SimpleCov coverage achieves 80%")
    
  end

  describe "Repo Achievements Index" do
    it 'shows a users repos achievements' do
      get api_v1_user_repo_repo_achievements_path(@user, @repo)
      
      expect(response).to be_successful
      expect(response.status).to eq(204)
    end
  end
end