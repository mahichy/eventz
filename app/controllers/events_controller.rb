class EventsController < ApplicationController

  before_action :require_signin, except: [:index, :show]
  before_action :require_admin, except: [:index, :show]



  def index
    # @age = rand(100)
    # @events = ['BugSmash', 'Hackathon', 'Kata Camp', 'Additional']
    # @events = Event.all
    @events = Event.upcoming
  end

  def show
    @event = Event.find(params[:id])
    @likers = @event.likers
    @categories = @event.categories
    if current_user
      @like = current_user.likes.find_by(event_id: @event.id)
    end
  end

  def edit
    @event = Event.find(params[:id])
  end

  def update
    @event = Event.find(params[:id])
    if @event.update(event_params)
      redirect_to @event, notice: "Event successfully updated!"
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
      redirect_to @event, alert: "Event successfully created!"
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
    permit(:name, :description, :location, :price, :starts_at, :capacity, :image_file_name, category_ids: [])
  end

  
end
