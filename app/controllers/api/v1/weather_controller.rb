class Api::V1::WeatherController < ApplicationController
  def index
    city_weather = WeatherFacade.weather(params[:city], params[:state])
    render json: WeatherSerializer.new(city_weather)
  end
end
