require "rails_helper"

RSpec.describe "Api::V1::Achievements", type: :request do

  before(:each) do
    @achievement1 = Achievement.create!(name: "SimpleCov Pro", criteria: "SimpleCov coverage achieves over 90%")
    @achievement2 = Achievement.create!(name: "SimpleCov Wizard", criteria: "SimpleCov coverage achieves 100%")
  end

  describe "User Achievements Index" do
    it 'shows a users achievements' do
      get api_v1_achievements_path
      
      expect(response).to be_successful
      expect(response.status).to eq(200)
      expect(response.body).to include("SimpleCov Pro")
      expect(response.body).to include("SimpleCov coverage achieves over 90%")
    end
  end

  describe "User Achievements Create" do
    it 'creates a user achievement' do
      achievement_params = {
        name: "SimpleCov Novice",
        criteria: "SimpleCov coverage achieves over 80%"
      }

      headers = {"CONTENT_TYPE" => "application/json"}

      post api_v1_achievements_path(achievement_params), params: achievement_params
      
      new_achievement = Achievement.last
      
      expect(response).to be_successful
      
      expect(new_achievement.name).to eq("SimpleCov Novice")
      expect(new_achievement.criteria).to eq("SimpleCov coverage achieves over 80%")
    end

    it 'sad path- achievement cant be made without both params filled in' do
      achievement_params = {
        name: "",
        criteria: "SimpleCov coverage achieves over 80%"
      }

      headers = {"CONTENT_TYPE" => "application/json"}

      post api_v1_achievements_path(achievement_params), params: achievement_params

      expect(response).to_not be_successful
      expect(response).to have_http_status(422)
      expect(response.body).to include("{\"name\":[\"can't be blank\"]}")
    end

    it 'sad path- achievement cant be made without both params filled in' do
      achievement_params = {
        name: "SimpleCov Pro",
        criteria: ""
      }

      headers = {"CONTENT_TYPE" => "application/json"}

      post api_v1_achievements_path(achievement_params), params: achievement_params

      expect(response).to_not be_successful
      expect(response).to have_http_status(422)
      expect(response.body).to include("{\"criteria\":[\"can't be blank\"]}")
    end

    it 'sad path- achievement already in the system' do
      achievement_params = {
        name: "SimpleCov Pro",
        criteria: "SimpleCov coverage achieves over 90%"
      }

      headers = {"CONTENT_TYPE" => "application/json"}

      post api_v1_achievements_path(achievement_params), params: achievement_params

      expect(response).to_not be_successful
      expect(response).to have_http_status(400)
      expect(response.body).to include("Achievement already in system")
    end
  end
end