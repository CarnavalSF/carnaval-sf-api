class API::SerializableEvent < JSONAPI::Serializable::Resource
  type 'events'

  attributes :title, :description, :location, :time, :end_time, :image_thumbnail, :image_original, :event_date

  attribute :date do
    @object.created_at
  end
end
