require 'rails_helper'

RSpec.describe 'User' do
  describe 'create' do
    it 'can create a User' do
      user_params = {
        # "google_id": "8819981768",
        "email": "picks_nose_and_eats_it@gmail.com",
        'password': 'boogs'
        # "token": "1/fFAGRNJru1FTz70BzhT3Zg"
      }
      headers = {"CONTENT_TYPE" => "application/json"}

      post '/api/v1/users', headers: headers, params: JSON.generate(user: user_params)
      expect(response).to be_successful
      expect(response).to have_http_status(:created)
      expect(response.status).to eq(201)
    end

    it 'returns serialized user' do
      params = {
        'email': 'e@mail.com',
        'password': 'food'
      }
      headers = {"CONTENT_TYPE" => "application/json"}

      post '/api/v1/users', headers: headers, params: JSON.generate(user: params)

      user = JSON.parse(response.body, symbolize_names: true)

      expect(user[:data][:attributes][:id]).is_a? Integer
      expect(user[:data][:attributes][:email]).is_a? String
      expect(User.find(user[:data][:attributes][:id])).is_a? User
    end
  end
end