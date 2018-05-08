class API::SerializableVendor < JSONAPI::Serializable::Resource
  type 'vendor'

  attributes :name, :description, :position, :location
  attribute :date do
    @object.created_at
  end
end
