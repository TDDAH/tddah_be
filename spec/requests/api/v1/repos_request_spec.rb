require "rails_helper"

RSpec.describe "Api::V1::Repos", type: :request do

  before(:each) do
    @user = User.create!(name: "snash", email: "turing@example.com", password: "ott123", password_confirmation: "ott123")  
    @repo = @user.repos.create!(owner: "s2an", name: "lunch_and_learn_be_7")
  end

  describe "Repos Show" do
    it "displays the repo's SimpleCov percentage" do
      get api_v1_user_repo_path(@user, @repo)

      expect(response).to be_successful
      expect(response.status).to eq(200)
      expect(response.body).to include("snash")
      expect(response.body).to include("lunch_and_learn_be_7")
      expect(response.body).to include("s2an")
      expect(response.body).to include("86.05")
    end
  end
end