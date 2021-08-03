class Api::V1::CityController < ApplicationController
  def index
    city = CityFacade.city_data(params[:city], params[:state_initials])
    new_city = City.find_or_create_by(city: city.city, state: city.state, summary: city.summary, total_score: city.total_score, categories_hash_array: city.categories_hash_array)
    if new_city.save
      render json: CitySerializer.new(new_city)
    else
      render json: 'Error'
    end
  end
end
