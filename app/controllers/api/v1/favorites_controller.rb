class Api::V1::FavoritesController < ApplicationController
  def create
    fav_city = City.find(params[:city_id])
    favorite = favorite_creator(fav_city)
    if favorite.save
      render json: FavoriteSerializer.new(favorite).serializable_hash.to_json, status: 201
    else
      render json: {
        error: "Missing or incorrect favorite params",
        status: 400
      }, status: 400
    end
  end

  def destroy
    Favorite.destroy(params[:id])
  end

  private

  def favorite_creator(city)
    Favorite.new(user_id: params[:user_id], city_id: params[:city_id], city_name: city.city, population: city.population, state: city.state, summary: city.summary, total_score: city.total_score, categories_hash_array: city.categories_hash_array)
  end
end