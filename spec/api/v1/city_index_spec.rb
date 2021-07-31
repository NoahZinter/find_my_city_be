require 'rails_helper'

RSpec.describe 'City' do
  describe 'index' do
    it 'returns city information' do

      city = 'denver'
      state_initials = 'co'

      get "/api/v1/city?city=#{city}&state=#{state_initials}"

      expect(response).to be_success
    end
  end
end