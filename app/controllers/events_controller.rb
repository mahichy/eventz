class EventsController < ApplicationController

  def index
    # @age = rand(100)
    # @events = ['BugSmash', 'Hackathon', 'Kata Camp', 'Additional']
    # @events = Event.all
    @events = Event.upcoming
  end

  def show
    @event = Event.find(params[:id])
  end

  def edit
    @event = Event.find(params[:id])
  end

  def update
    @event = Event.find(params[:id])
    if @event.update(event_params)
      redirect_to @event
    else
      render :edit, status: :unprocessable_entity
    end
  end

  def new
    @event = Event.new
  end

  def create
    @event = Event.new(event_params)
    if @event.save
      redirect_to @event
    else
      render :new, status: :unprocessable_entity
    end
  end

  def destroy
    @event = Event.find(params[:id])
    @event.destroy
    redirect_to events_url, status: :see_others
  end






  private

  def event_params
    params.require(:event).
    permit(:name, :description, :location, :price, :starts_at, :capacity, :image_file_name)
  end

  
end
