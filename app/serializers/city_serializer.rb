class CitySerializer
  include JSONAPI::Serializer
  attributes :summary, :total_score, :city, :state, :picture
end
