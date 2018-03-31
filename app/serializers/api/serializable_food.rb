class API::SerializableFood < JSONAPI::Serializable::Resource
  type 'food'

  attributes :name, :description, :position, :image_thumbnail, :image_original

  attribute :date do
    @object.created_at
  end
end
