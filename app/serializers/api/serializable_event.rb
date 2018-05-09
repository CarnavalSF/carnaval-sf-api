class API::SerializableEvent < JSONAPI::Serializable::Resource
  type 'events'

  attributes :title, :location, :time, :end_time, :event_date

  attribute :date do
    @object.created_at
  end
end
