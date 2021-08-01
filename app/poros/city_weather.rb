class CityWeather
  attr_reader :lat,
              :lon,
              :temp,
              :temp_min,
              :temp_max,
              :humidity,
              :description,
              :visibility,
              :wind_speed,
              :sunrise,
              :sunset

  def initialize(data)
    @lat = data[:coord][:lat]
    @lon = data[:coord][:lon]
    @temp = data[:main][:temp]
    @temp_min = data[:main][:temp_min]
    @temp_max = data[:main][:temp_max]
    @humidity = data[:main][:humidity]
    @description = data[:weather][0][:description]
    @visibility = data[:visibility]
    @wind_speed = data[:wind][:speed]
    @sunrise = data[:sys][:sunrise]
    @sunset = data[:sys][:sunset]
  end

end
