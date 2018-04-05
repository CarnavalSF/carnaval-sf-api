class API::SerializableEvent < JSONAPI::Serializable::Resource
  type 'events'

  attributes :title, :description, :location, :time, :image_thumbnail, :image_original

  attribute :date do
    @object.created_at
  end
end
