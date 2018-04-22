class API::SerializableFood < JSONAPI::Serializable::Resource
  type 'food'

  attributes :name, :description, :position, :location, :image_thumbnail, :image_original

  attribute :date do
    @object.created_at
  end
end
