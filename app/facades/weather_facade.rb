class WeatherFacade

  def self.weather(city, state)
    data = WeatherService.get_weather_info(city, state)
    CityWeather.new(data)
  end
end
