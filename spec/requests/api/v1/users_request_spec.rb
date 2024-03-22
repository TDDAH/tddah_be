require "rails_helper"

RSpec.describe 'Api::V1::Users', type: :request do
  describe "Users Index" do
    it 'displays all the users' do
      user = User.create!(name: "John Summit", email: "jsums@example.com", password: "js123", password_confirmation: "js123")
      user1 = User.create!(name: "Of the Trees", email: "ott@example.com", password: "ott123", password_confirmation: "ott123")
      user2 = User.create!(name: "Liquid Stranger", email: "liquid@example.com", password: "ls123", password_confirmation: "ls123")

      get api_v1_users_path

      expect(response).to be_successful

      json = JSON.parse(response.body, symbolize_names: true)

      users = json[:data]
      expect(users.count).to eq(3)

      users.each do |user|
        expect(users).to be_an(Array)

        expect(user).to have_key(:id)
        expect(user[:id]).to be_an(String)

        expect(user[:attributes]).to have_key(:name)
        expect(user[:attributes][:name]).to be_a(String)

        expect(user[:attributes]).to have_key(:email)
        expect(user[:attributes][:email]).to be_a(String)
      end
    end
  end

  describe "Users Show" do
    it 'displays a users show page' do
      user = User.create!(name: "John Summit", email: "jsums@example.com", password: "js123", password_confirmation: "js123")
      id = user.id

      get api_v1_user_path(id)

      expect(response).to be_successful

      json = JSON.parse(response.body, symbolize_names: true)

      user = json[:data]
    
      expect(user).to be_an(Hash)

      expect(user).to have_key(:id)
      expect(user[:id]).to be_an(String)

      expect(user[:attributes]).to have_key(:name)
      expect(user[:attributes][:name]).to be_a(String)

      expect(user[:attributes]).to have_key(:email)
      expect(user[:attributes][:email]).to be_a(String)
    end
  end

  describe "Users Create" do
    it 'creates a user' do
      user_params = { 
        name: "Barclay Crenshaw",
        email: "barclay@example.com",
        password: "bass123",
        password_confirmation: "bass123"
      }

      headers = {"CONTENT_TYPE" => "application/json"}

      post api_v1_users_path, headers: headers, params: JSON.generate(user: user_params)

      new_user = User.last

      expect(response).to be_successful
      expect(new_user.name).to eq(user_params[:name])
      expect(new_user.email).to eq(user_params[:email])
      expect(new_user.password).to eq(user_params[:password])
      expect(new_user.password_confirmation).to eq(user_params[:password_confirmation])
    end

    it 'sad path- error if user is not created' do
      user_params = { 
        name: "",
        email: "barclay@example.com",
        password: "bass123",
        password_confirmation: "bass123"
      }

      headers = {"CONTENT_TYPE" => "application/json"}

      post api_v1_users_path, headers: headers, params: JSON.generate(user: user_params)

      new_user = User.last

      expect(response).to_not be_successful
      expect(response).to have_http_status(401)
    end
  end

  describe "Users destroy" do
    it 'deletes a user' do
      user = User.create!(name: "John Summit", email: "jsums@example.com", password: "js123", password_confirmation: "js123")
    
      expect(User.count).to eq(1)

      delete api_v1_user_path(user.id)

      expect(response).to be_successful
      expect(User.count).to eq(0)
      expect{User.find(user.id)}.to raise_error(ActiveRecord::RecordNotFound)
    end
  end
end