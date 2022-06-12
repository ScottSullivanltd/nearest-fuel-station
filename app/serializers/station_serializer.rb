class StationSerializer
  include JSONAPI::Serializer
  attributes :name, :address, :fuel_type, :access_times
end
