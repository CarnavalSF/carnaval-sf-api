class API::SerializableSponsor < JSONAPI::Serializable::Resource
  type 'sponsors'

  attributes :name, :website, :position, :logo_thumbnail, :logo_original, :featured

  attribute :date do
    @object.created_at
  end
end
