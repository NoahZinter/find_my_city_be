class CitySerializer
  include JSONAPI::Serializer
  attributes :id, :summary, :total_score, :city, :state, :categories_hash_array
end
