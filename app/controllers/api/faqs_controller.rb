class API::FaqsController < ApplicationController
  def index
    faqs = Faq.all.sorted

    render jsonapi: faqs,
      class: {
        Faq: API::SerializableFaq
      }
  end
end
