require 'rails_helper'

RSpec.describe 'WeatherFacade API' do
  it 'returns weather data correctly for facade', :vcr do
    VCR.use_cassette('returns_weather_data_correctly') do
      data = WeatherFacade.weather("Charlotte", "NC")

      expect(data.lat).to eq(35.2271)
      expect(data.lon).to eq(-80.8431)
      expect(data.temp).to eq(302.66)
      expect(data.temp_max).to eq(307.91)
      expect(data.temp_min).to eq(304.15)
      expect(data.humidity).to eq(52)
      expect(data.description).to eq("scattered clouds")
      expect(data.visibility).to eq(10000)
      expect(data.wind_speed).to eq(3.09)
      expect(data.sunrise).to eq(1627727501)
      expect(data.sunset).to eq(1627777658)
    end
  end
end
