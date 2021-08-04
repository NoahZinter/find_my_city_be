class FavoriteSerializer
  include JSONAPI::Serializer
  attributes :user_id, :city_id
end
