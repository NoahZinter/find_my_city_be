require 'rails_helper'

RSpec.describe 'User' do
  describe 'create' do
    it 'can create a User' do
      post '/api/v1/users?email=joe@p.com&password=pwd'
      expect(response).to have_http_status(:created)
      expect(response.status).to eq(201)
    end

    it 'returns serialized user' do
      post '/api/v1/users?email=joe@p.com&password=pwd'
      user = JSON.parse(response.body, symbolize_names: true)

      expect(user[:data][:attributes][:id]).is_a? Integer
      expect(user[:data][:attributes][:email]).to eq 'joe@p.com'
      expect(User.find(user[:data][:attributes][:id])).is_a? User
    end

    it 'does not re-create user' do
      orig_id = User.create!(email: 'e@mail.com', password: 'food').id
      post '/api/v1/users?email=e@mail.com&password=food'
      user = JSON.parse(response.body, symbolize_names: true)

      expect(user[:data][:attributes][:id]).to eq orig_id
    end
  end

  describe 'favorites' do
    it 'returns serialized user favorites' do
      user_1 = create(:user)
      city_1 = create(:city)
      city_2 = create(:city)
      city_3 = create(:city)
      city_4 = create(:city)
      city_5 = create(:city)

      Favorite.create!(user_id: user_1.id, city_id: city_1.id, city_name: city_1.city, state: city_1.state, summary: city_1.summary, total_score: city_1.total_score, categories_hash_array: city_1.categories_hash_array, population: city_1.population)
      Favorite.create!(user_id: user_1.id, city_id: city_2.id, city_name: city_2.city, state: city_2.state, summary: city_2.summary, total_score: city_2.total_score, categories_hash_array: city_2.categories_hash_array, population: city_2.population)
      Favorite.create!(user_id: user_1.id, city_id: city_3.id, city_name: city_3.city, state: city_3.state, summary: city_3.summary, total_score: city_3.total_score, categories_hash_array: city_3.categories_hash_array, population: city_3.population)
      Favorite.create!(user_id: user_1.id, city_id: city_4.id, city_name: city_4.city, state: city_4.state, summary: city_4.summary, total_score: city_4.total_score, categories_hash_array: city_4.categories_hash_array, population: city_4.population)
      Favorite.create!(user_id: user_1.id, city_id: city_5.id, city_name: city_5.city, state: city_5.state, summary: city_5.summary, total_score: city_5.total_score, categories_hash_array: city_5.categories_hash_array, population: city_5.population)

      get "/api/v1/users/#{user_1.id}/favorites"

      expect(response.status).to eq 200
      favorites = JSON.parse(response.body, symbolize_names: true)

      favorites[:data].each do |hash|
        expect(hash[:attributes][:user_id]).is_a? Integer
        expect(hash[:attributes][:city_id]).is_a? Integer
        expect(hash[:attributes][:city_name]).is_a? String
        expect(hash[:attributes][:population]).is_a? Integer
        expect(hash[:attributes][:state]).is_a? String
        expect(hash[:attributes][:summary]).is_a? String
        expect(hash[:attributes][:total_score]).is_a? Float
        expect(hash[:attributes][:categories_hash_array]).is_a? Array
      end
    end
  end
end
