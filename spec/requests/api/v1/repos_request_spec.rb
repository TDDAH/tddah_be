require "rails_helper"

RSpec.describe 'Api::V1::Repos', type: :request do

  before(:each) do
    @user = User.create!(name: "delaneymiranda1", email: "delaney.miranda1@example.com", password: "js123", password_confirmation: "js123")
    @user1 = User.create!(name: "s2an", email: "ott@example.com", password: "ott123", password_confirmation: "ott123")  
  end

  describe "Repos Show" do
    it 'displays the repo simplecov %' do
      # repo1 = @user.repos.create!(owner: @user.name, name: "lunch_and_learn")
      repo2 = @user1.repos.create!(owner: @user1.name, name: "lunch_and_learn_be_7")
      
      get api_v1_user_repo_path(repo2.id, @user1.id)

      expect(response).to be_successful
      
      json = JSON.parse(response.body, symbolize_names: true)
      repo = json[:data]

    end
  end
end