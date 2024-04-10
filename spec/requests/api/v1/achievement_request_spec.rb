require "rails_helper"

RSpec.describe "Api::V1::Achievements", type: :request do

  before(:each) do
    @achievement1 = Achievement.create!(name: "SimpleCov Pro", criteria: "SimpleCov coverage achieves over 95%")
    @achievement2 = Achievement.create!(name: "SimpleCov Wizard", criteria: "SimpleCov coverage achieves 100%")
  end

  describe "User Achievements Index" do
    it 'shows a users achievements' do
      get api_v1_achievements_path
      
      expect(response).to be_successful
      expect(response.status).to eq(200)
      expect(response.body).to include("SimpleCov Pro")
      expect(response.body).to include("SimpleCov coverage achieves over 95%")
    end
  end

  describe "User Achievements Create" do
    it 'creates a user achievement' do
      achievement_params = {
        name: "SimpleCov Novice",
        criteria: "SimpleCov coverage achieves over 85%"
      }

      headers = {"CONTENT_TYPE" => "application/json"}

      post api_v1_achievements_path(achievement_params), params: achievement_params
      
      new_achievement = Achievement.last
      
      expect(response).to be_successful
      
      expect(new_achievement.name).to eq("SimpleCov Novice")
      expect(new_achievement.criteria).to eq("SimpleCov coverage achieves over 85%")
    end

    it 'sad path- achievement cant be made without both params filled in' do
      achievement_params = {
        name: "",
        criteria: "SimpleCov coverage achieves over 85%"
      }

      headers = {"CONTENT_TYPE" => "application/json"}

      post api_v1_achievements_path(achievement_params), params: achievement_params

      expect(response).to_not be_successful
      expect(response).to have_http_status(401)
    end
  end
end