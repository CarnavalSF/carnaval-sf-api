class API::SerializableFood < JSONAPI::Serializable::Resource
  type 'food'

  attributes :name, :description, :position, :location

  attribute :date do
    @object.created_at
  end
end
