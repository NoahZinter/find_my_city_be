class Api::V1::WeatherController < ApplicationController
  def show
    city_weather = WeatherFacade.weather(params[:city], params[:state_initials])
    render json: WeatherSerializer.new(city_weather)
  end
end
