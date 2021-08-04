class FavoriteSerializer
  include JSONAPI::Serializer
  attributes :user_id, :city_id, :city_name, :population, :state, :summary, :total_score, :categories_hash_array
end
