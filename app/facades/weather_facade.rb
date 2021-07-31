class WeatherFacade

  def self.weather(city, state_initials)
    data = WeatherService.get_weather_info(city, state_initials)
    # binding.pry
    CityWeather.new(data)
  end
end
