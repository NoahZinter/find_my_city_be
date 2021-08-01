class WeatherSerializer
  include JSONAPI::Serializer
  attributes :lat, :lon, :temp, :temp_max, :temp_min, :humidity, :description, :visibility, :wind_speed, :sunrise, :sunset
end
