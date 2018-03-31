class API::SerializableFaq < JSONAPI::Serializable::Resource
  type 'faqs'

  attributes :question, :answer, :position

  attribute :date do
    @object.created_at
  end
end
