require "rails_helper"

RSpec.describe 'Api::V1::Users', type: :request do
  describe "Users Index" do
    it 'displays all the users' do
      create_list(:user, 4)

      get '/api/v1/users'

      expect(response).to be_successful

      json = JSON.parse(response.body, symbolize_names: true)

      users = json[:data]
      expect(users.count).to eq(4)

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
end