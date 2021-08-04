require 'rails_helper'

RSpec.describe 'Favorites Requests' do
  describe '#create' do
    it 'can create a favorite' do
      user_id = create(:user).id
      city_id = create(:city).id
      post "/api/v1/favorites?user_id=#{user_id}&city_id=#{city_id}"
      created_favorite = Favorite.last

      expect(response.status).to eq 201
      expect(created_favorite.user_id).to eq user_id
      expect(created_favorite.city_id).to eq city_id
    end

    it 'serializes favorite data' do
      user_id = create(:user).id
      city_id = create(:city).id
      post "/api/v1/favorites?user_id=#{user_id}&city_id=#{city_id}"
      fav = JSON.parse(response.body, symbolize_names: true)

      expect(fav[:user_id]).is_a? Integer
      expect(fav[:city_id]).is_a? Integer
      expect(fav[:city_name]).is_a? String
      expect(fav[:state]).is_a? String
      expect(fav[:summary]).is_a? String
      expect(fav[:population]).is_a? Integer
      expect(fav[:total_score]).is_a? Float
      expect(fav[:categories_hash_array]).is_a? Array
    end
  end

  describe '#delete' do
    it 'deletes a favorite' do
      user_id = create(:user).id
      city_id = create(:city).id
      post "/api/v1/favorites?user_id=#{user_id}&city_id=#{city_id}"
      created_favorite = Favorite.last

      expect(created_favorite).is_a? Favorite

      delete "/api/v1/favorites/#{created_favorite.id}"

      expect{Favorite.find(created_favorite.id)}.to raise_error(ActiveRecord::RecordNotFound)
    end
  end
end