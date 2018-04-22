class API::SerializableVendor < JSONAPI::Serializable::Resource
  type 'vendor'

  attributes :name, :description, :position, :location, :image_thumbnail, :image_original

  attribute :date do
    @object.created_at
  end
end
