require "rails_helper"

RSpec.describe "Api::V1::Achievements", type: :request do

  before(:each) do
    @user1 = User.create!(name: "snash", email: "turing@example.com", password: "ott123", password_confirmation: "ott123")  
    @user2 = User.create!(name: "mdelaney", email: "example@example.com", password: "aaa123", password_confirmation: "aaa123") 
    @achievement1 = @user1.achievements.create!(name: "SimpleCov Pro", criteria: "SimpleCov coverage achieves over 95%")
    @achievement2 = @user2.achievements.create!(name: "SimpleCov Wizard", criteria: "SimpleCov coverage achieves 100%")
  end

  describe "User Achievements Index" do
    it 'shows a users achievements' do
      get api_v1_user_achievements_path(@user1)

      expect(response).to be_successful
      expect(response.status).to eq(200)
      expect(response.body).to include("SimpleCov Pro")
      expect(response.body).to include("SimpleCov coverage achieves over 95%")
    end
  end
end