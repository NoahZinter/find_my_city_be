require 'rails_helper'

RSpec.describe 'WeatherService API' do
  it 'returns weather data correctly', :vcr do
    data = WeatherService.get_weather_info("Charlotte", "NC")

    expect(data).to be_a Hash
    expect(data).to have_key(:coord)
    expect(data[:coord]).to have_key(:lon)
    expect(data[:coord]).to have_key(:lat)
    expect(data).to have_key(:weather)
    expect(data[:weather][0]).to have_key(:description)
    expect(data).to have_key(:main)
    expect(data[:main]).to have_key(:temp)
  end
end
