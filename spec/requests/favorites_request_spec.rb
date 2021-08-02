require 'rails_helper'

RSpec.describe 'Favorites Requests' do
  describe '#create' do
    it 'can create a favorite' do
      user_id = create(:user).id
      city_id = create(:city).id
      favorite_params = {
        user_id: user_id,
        city_id: city_id
      }
      headers = { "CONTENT_TYPE" => "application/json"}
      post '/api/v1/favorites', headers: headers, params: JSON.generate(favorite: favorite_params)
      created_favorite = Favorite.last

      expect(response.status).to eq 201
    end
  end
end