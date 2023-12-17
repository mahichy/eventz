class EventzController < ApplicationController

  def index
    # @age = rand(100)
    # @events = ['BugSmash', 'Hackathon', 'Kata Camp', 'Additional']
    @events = Event.all
  end

  def show
    @event = Event.find(params[:id])
  end
end
