require 'rails_helper'

RSpec.describe 'WeatherFacade API' do
  it 'returns weather data correctly for facade', :vcr do
      data = WeatherFacade.weather("Charlotte", "NC")

      expect(data.lat).to be_a(Float)
      expect(data.lon).to be_a(Float)
      expect(data.temp).to be_a(Float)
      expect(data.temp_max).to be_a(Float)
      expect(data.temp_min).to be_a(Float)
      expect(data.humidity).to be_a(Integer)
      expect(data.description).to be_a(String)
      expect(data.visibility).to be_a(Integer)
      expect(data.wind_speed).to be_a(Float).or be_a(Integer)
      expect(data.sunrise).to be_a(Integer)
      expect(data.sunset).to be_a(Integer)
  end
end
