class API::EventsController < ApplicationController
  def index
    events = Event.all.sorted

    render jsonapi: events,
      class: {
        Event: API::SerializableEvent
      }
  end
end
