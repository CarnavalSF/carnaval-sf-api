class API::SerializableEvent < JSONAPI::Serializable::Resource
  type 'events'

  attributes :title, :description, :position

  attribute :date do
    @object.created_at
  end
end
