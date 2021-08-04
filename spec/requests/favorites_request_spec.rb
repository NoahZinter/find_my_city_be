require 'rails_helper'

RSpec.describe 'Favorites Requests' do
  describe '#create' do
    before(:each) do
      @categories_array = '[{:name=>"Housing", :score_out_of_10=>3.8375},
    {:name=>"Cost of Living", :score_out_of_10=>5.102},
    {:name=>"Startups", :score_out_of_10=>7.8645},
    {:name=>"Venture Capital", :score_out_of_10=>6.117},
    {:name=>"Travel Connectivity", :score_out_of_10=>4.243},
    {:name=>"Commute", :score_out_of_10=>4.530000000000001},
    {:name=>"Business Freedom", :score_out_of_10=>8.671},
    {:name=>"Safety", :score_out_of_10=>5.371},
    {:name=>"Healthcare", :score_out_of_10=>8.615666666666666},
    {:name=>"Education", :score_out_of_10=>3.6245},
    {:name=>"Environmental Quality", :score_out_of_10=>7.11675},
    {:name=>"Economy", :score_out_of_10=>6.5145},
    {:name=>"Taxation", :score_out_of_10=>4.346},
    {:name=>"Internet Access", :score_out_of_10=>5.418500000000001},
    {:name=>"Leisure & Culture", :score_out_of_10=>6.2235},
    {:name=>"Tolerance", :score_out_of_10=>7.860499999999999},
    {:name=>"Outdoors", :score_out_of_10=>7.932999999999999}]'
    end

    it 'can create a favorite' do
      user_id = create(:user).id
      city_id = create(:city).id
      favorite_params = {
        user_id: user_id,
        city_id: city_id,
        city_name: 'Denver',
        state: 'Colorado',
        summary: 'It is a good place',
        total_score: 55.55, 
        categories_hash_array: @categories_array
      }
      headers = { "CONTENT_TYPE" => "application/json"}
      post '/api/v1/favorites', headers: headers, params: JSON.generate(favorite: favorite_params)
      created_favorite = Favorite.last

      expect(response.status).to eq 201
      expect(created_favorite.user_id).to eq user_id
      expect(created_favorite.city_id).to eq city_id
    end

    it 'serializes favorite data' do
      user_id = create(:user).id
      city_id = create(:city).id
      favorite_params = {
        user_id: user_id,
        city_id: city_id,
        city_name: 'Denver',
        state: 'Colorado',
        summary: 'It is a good place',
        total_score: 55.55, 
        categories_hash_array: @categories_array
      }
      headers = { "CONTENT_TYPE" => "application/json"}
      post '/api/v1/favorites', headers: headers, params: JSON.generate(favorite: favorite_params)

      fav = JSON.parse(response.body, symbolize_names: true)
      fav = fav[:data][:attributes]

      expect(fav[:user_id]).is_a? Integer
      expect(fav[:city_id]).is_a? Integer
      expect(fav[:city_name]).to eq 'Denver'
      expect(fav[:state]).to eq 'Colorado'
      expect(fav[:summary]).to eq 'It is a good place'
      expect(fav[:total_score]).to eq 55.55
      expect(fav[:categories_hash_array]).to eq @categories_array
    end
  end

  describe '#delete' do
    it 'deletes a favorite' do
      
    end
  end
end