require 'rails_helper'

RSpec.describe 'WeatherFacade API' do
  it 'returns weather data correctly for facade' do
    VCR.use_cassette('returns weather data correctly') do
      data = WeatherFacade.weather("Charlotte", "NC")
    
      expect(data.lat).to eq(35.2271)
      expect(data.lon).to eq(-80.8431)
      expect(data.temp).to eq(301.78)
      expect(data.temp_max).to eq(303.55)
      expect(data.temp_min).to eq(299.15)
      expect(data.humidity).to eq(70)
      expect(data.description).to eq("broken clouds")
      expect(data.visibility).to eq(10000)
      expect(data.wind_speed).to eq(1.54)
      expect(data.sunrise).to eq(1627727501)
      expect(data.sunset).to eq(1627777658)
    end
  end
end
