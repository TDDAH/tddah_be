require "rails_helper"

RSpec.describe "Api::V1::Repos", type: :request do

  before(:each) do
    @user = User.create!(name: "snash", email: "turing@example.com", password: "ott123", password_confirmation: "ott123")  
    @repo = @user.repos.create!(owner: "s2an", name: "lunch_and_learn_be_7")
  end

  describe "Repos Show" do
    it "displays the repo's SimpleCov percentage" do
      # require "pry"; binding.pry
      get api_v1_user_repo_path(@user, @repo)
require "pry"; binding.pry
      expect(response).to be_successful
      
      # json = JSON.parse(response.body, symbolize_names: true)
      # repo = json[:data]

    end
  end
end