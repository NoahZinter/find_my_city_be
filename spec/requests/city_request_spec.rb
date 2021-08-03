require 'rails_helper'

RSpec.describe 'City Request' do
  describe 'index' do
    it 'searches for a city' do
      get '/api/v1/city?city=Denver&state=CO'
      
    end
  end
end