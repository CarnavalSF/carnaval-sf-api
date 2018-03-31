class API::SponsorsController < ApplicationController
  def index
    sponsors = Sponsor.all.sorted

    render jsonapi: sponsors,
      class: {
        Sponsor: API::SerializableSponsor
      }
  end
end
