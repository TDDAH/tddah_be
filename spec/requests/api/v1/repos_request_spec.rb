require "rails_helper"

RSpec.describe "Api::V1::Repos", type: :request do

  before(:each) do
    @user = User.create!(name: "snash", email: "turing@example.com", password: "ott123", password_confirmation: "ott123")  
  end

  describe "Repos Index" do
    xit "displays all the users repos" do
    #   @repo = @user.repos.create!(owner: "s2an", name: "lunch_and_learn_be_7")
    #   get api_v1_user_repo_path(@user, @repo)
    # #  require "pry"; binding.pry 
    #   expect(response).to be_successful
    #   expect(response.status).to eq(200)
    #   expect(response.body).to include("snash")
    #   expect(response.body).to include("lunch_and_learn_be_7")
    #   expect(response.body).to include("s2an")
    #   expect(response.body).to include("86.05")
    end
  end
  
  describe "Repos Show" do
    it "displays the repo's SimpleCov percentage" do
      @repo = @user.repos.create!(owner: "s2an", name: "lunch_and_learn_be_7")
      get api_v1_user_repo_path(@user, @repo)
    #  require "pry"; binding.pry 
      expect(response).to be_successful
      expect(response.status).to eq(200)
      expect(response.body).to include("snash")
      expect(response.body).to include("lunch_and_learn_be_7")
      expect(response.body).to include("s2an")
      expect(response.body).to include("86.05")
    end
    
    # we need error handling in the show action to ensure this
    it 'sad path- if a repo does not have index.html file' do
      repo_no_file = @user.repos.create!(owner: "s2an", name: "tea_subscription_be_7")

      get api_v1_user_repo_path(@user, repo_no_file)

      # the response is successful here, because it is a weird frakenstien of a response...
      expect(response).to be_successful
      expect(response.status).to eq(200)

      expect(response.body).to include("Coverage file not found.")
    end
  end

  describe "Repos Create" do
    it "creates a repo" do
      repo_params = {
        user: @user.id,
        owner: "delaneymiranda1",
        name: "be_cheap_date"
      }

      headers = {"CONTENT_TYPE" => "application/json"}

      post api_v1_user_repos_path(@user, repo_params), params: repo_params

      new_repo = Repo.last
      
      expect(response).to be_successful
      
      expect(new_repo.owner).to eq("delaneymiranda1")
      expect(new_repo.name).to eq("be_cheap_date")
    end

    it 'sad path- user fails to fill in a param' do
      repo_params = {
        user: @user.id,
        owner: "",
        name: "be_cheap_date"
      }

      post api_v1_user_repos_path(@user, repo_params), params: repo_params

      headers = {"CONTENT_TYPE" => "application/json"}

      expect(response).to_not be_successful
      expect(response).to have_http_status(401)
    end
  end

  describe "Repos destroy" do
    it 'deletes a users repo' do
      @repo = @user.repos.create!(owner: "s2an", name: "lunch_and_learn_be_7")
      expect(Repo.count).to eq(1)

      delete api_v1_user_repo_path(@user, @repo)

      expect(response).to be_successful
      expect(Repo.count).to eq(0)
      expect{Repo.find(@repo.id)}.to raise_error(ActiveRecord::RecordNotFound)
    end
  end
end