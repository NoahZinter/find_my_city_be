class UserSerializer
    include JSONAPI::Serializer
    attributes :google_id, :email, :token
end