class EventsController < ApplicationController
  include Authorize

  before_action :set_event, only: [:edit, :update, :destroy]

  def index
    @events = Event.all.sorted
  end

  def new
    @event = Event.new
  end

  def create
    @event = Event.new(event_params)

    if @event.save
      @event.move_to_top
      redirect_to events_url, success: 'Event created successfully.'
    else
      render :new
    end
  end

  def edit; end

  def update
    if @event.update_attributes(event_params)
      redirect_to edit_event_url(@event), success: 'Event updated successfully.'
    else
      render :edit
    end
  end

  def destroy
    @event.remove_from_list
    redirect_to events_url, error: 'Event destroyed.' if @event.destroy
  end

  private

  def event_params
    params.require(:event).permit!
  end

  def set_event
    @event = Event.find_by(id: params[:id])
  end
end
