require "rails_helper"

describe 'CityWeather' do
  it 'shows city weather info' do
    springfield = {
                    "coord": {
                        "lon": -89.6437,
                        "lat": 39.8017
                    },
                    "weather": [
                        {
                            "id": 804,
                            "main": "Clouds",
                            "description": "overcast clouds",
                            "icon": "04d"
                        }
                    ],
                    "base": "stations",
                    "main": {
                        "temp": 289.39,
                        "feels_like": 289.37,
                        "temp_min": 288.76,
                        "temp_max": 291.53,
                        "pressure": 1018,
                        "humidity": 88
                    },
                    "visibility": 10000,
                    "wind": {
                        "speed": 2.57,
                        "deg": 70
                    },
                    "clouds": {
                        "all": 90
                    },
                    "dt": 1627756228,
                    "sys": {
                        "type": 1,
                        "id": 5899,
                        "country": "US",
                        "sunrise": 1627729002,
                        "sunset": 1627780382
                    },
                    "timezone": -18000,
                    "id": 4250542,
                    "name": "Springfield",
                    "cod": 200
                }
    data = CityWeather.new(springfield)

    expect(data.lat).to eq(39.8017)
    expect(data.lon).to eq(-89.6437)
    expect(data.temp).to eq(289.39)
    expect(data.temp_max).to eq(291.53)
    expect(data.temp_min).to eq(288.76)
    expect(data.humidity).to eq(88)
    expect(data.description).to eq("overcast clouds")
    expect(data.visibility).to eq(10000)
    expect(data.wind_speed).to eq(2.57)
    expect(data.sunrise).to eq(1627729002)
    expect(data.sunset).to eq(1627780382)
  end
end
