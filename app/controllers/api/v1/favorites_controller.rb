class Api::V1::FavoritesController < ApplicationController
  def create
    favorite = Favorite.new(favorite_params)
    if favorite.save
      render json: FavoriteSerializer.new(favorite).serializable_hash.to_json, status: 201
    else
      render json: {
        error: "Missing or incorrect favorite params",
        status: 400
      }, status: 400
    end
  end

  private

  def favorite_params
    params.require(:favorite).permit(:user_id, :city_id, :city_name, :state, :summary, :total_score, :categories_hash_array)
  end
end