require 'rails_helper'

RSpec.describe 'City Request' do
  describe 'index' do
    it 'searches for a city' do
      get '/api/v1/city?city=Denver&state=CO'

      expect(response.status).to eq 200

      city = JSON.parse(response.body, symbolize_names: true)
      city = city[:data]

      expect(city[:type]).to eq 'city'
      expect(city[:id]).is_a? String

      att = city[:attributes]
      expect(att[:id]).is_a? Integer
      expect(att[:summary]).is_a? String
      expect(att[:total_score]).is_a? Float
      expect(att[:city]).to eq 'Denver'
      expect(att[:state]).to eq 'Colorado'
      expect(att[:categories_hash_array]).is_a? Array

      cats = att[:categories_hash_array]

      cats.each do |hash|
        expect(hash[:name]).is_a? String
        expect(hash[:score_out_of_10]).is_a? Float
      end
    end

    it 'does not recreate created city' do
      get '/api/v1/city?city=Denver&state=CO'
      expect(response.status).to eq 200
      city = JSON.parse(response.body, symbolize_names: true)
      id = city[:data][:id]

      get '/api/v1/city?city=Denver&state=CO'
      expect(response.status).to eq 200
      new_city = JSON.parse(response.body, symbolize_names: true)

      expect(new_city[:data][:id]).to eq id
    end

    it 'searches for multi word cities' do
      get '/api/v1/city?city=san francisco&state=CA'

      expect(response.status).to eq 200

      city = JSON.parse(response.body, symbolize_names: true)
      city = city[:data]

      expect(city[:type]).to eq 'city'
      expect(city[:id]).is_a? String

      att = city[:attributes]
      expect(att[:id]).is_a? Integer
      expect(att[:summary]).is_a? String
      expect(att[:total_score]).is_a? Float
      expect(att[:city]).to eq 'San Francisco Bay Area'
      expect(att[:state]).to eq 'California'
      expect(att[:categories_hash_array]).is_a? Array

      cats = att[:categories_hash_array]

      cats.each do |hash|
        expect(hash[:name]).is_a? String
        expect(hash[:score_out_of_10]).is_a? Float
      end
    end
  end
end