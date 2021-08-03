require 'rails_helper'

RSpec.describe 'User' do
  describe 'create' do
    it 'can create a User' do
      user_params = {
        "google_id": "8819981768",
        "email": "picks_nose_and_eats_it@gmail.com",
        "token": "1/fFAGRNJru1FTz70BzhT3Zg"
      }
      headers = {"CONTENT_TYPE" => "application/json"}

      User.create(user_params)

      post '/api/v1/users', headers: headers, params: JSON.generate(user: user_params)
      expect(response).to be_successful
      expect(response).to have_http_status(:created)
      expect(response.status).to eq(201)
    end
  end
end