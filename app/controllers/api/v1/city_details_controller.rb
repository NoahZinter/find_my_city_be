class Api::V1::CityDetailsController < ApplicationController
def index
    city = CityDetailsFacade.city_data(params[:city], params[:state_initials])
    render json: CityDetailsSerializer.new(city)
  end
end