class Api::V1::CityController < ApplicationController
  def index
    city = CityFacade.city_data(params[:city], params[:state_initials])
    if city == false
      render json: { error: "City not found" }, status: :not_found
    else
      new_city = City.find_or_create_by(city: city.city, state: city.state, summary: city.summary, total_score: city.total_score, categories_hash_array: city.categories_hash_array, population: city.population)
      if new_city.save
        render json: CitySerializer.new(new_city)
      end
    end
  end
end
