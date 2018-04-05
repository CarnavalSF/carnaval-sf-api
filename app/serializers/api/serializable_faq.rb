class API::SerializableFaq < JSONAPI::Serializable::Resource
  type 'faqs'

  attributes :question, :answer, :position, :category

  attribute :date do
    @object.created_at
  end
end
