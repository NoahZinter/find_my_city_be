class Api::V1::CityController < ApplicationController
  def index
    city = CityFacade.city_data(params[:city], params[:state_initials])
    render json: CitySerializer.new(city)
  end
end
