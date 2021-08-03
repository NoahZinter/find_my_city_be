class WeatherService
  def self.get_weather_info(city, state)
    response = Faraday.get("http://api.openweathermap.org/data/2.5/weather?units=imperial&q=#{city},#{state},US&APPID=#{ENV['WEATHER_API_KEY']}")
    JSON.parse(response.body, symbolize_names: true)
  end
end
