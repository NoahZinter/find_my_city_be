class WeatherService
  def self.get_weather_info(city, state_initials)
    response = Faraday.get("http://api.openweathermap.org/data/2.5/weather?unit=imperial&q=#{city},#{state_initials},US&APPID=#{ENV['WEATHER_API_KEY']}")
    JSON.parse(response.body, symbolize_names: true)
  end
end
