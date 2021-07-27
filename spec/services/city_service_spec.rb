require 'rails_helper'

RSpec.describe 'CityService API' do
  before :each do
    FactoryBot.reload
  end

  describe 'happy path' do
    it '' do
      get '/api/v1/'

      expect(response).to be_successful

       = JSON.parse(response.body, symbolize_names: true)

      expect(.count).to eq(0)

      expect(book).to have_key(:id)
      expect(book[:id]).to be_an(Integer)
    end
  end

  describe 'sad path' do
    it '' do
      get '/api/v1/'

    end
  end
end
