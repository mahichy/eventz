class EventzController < ApplicationController

  def index
    # @age = rand(100)
    @events = ['BugSmash', 'Hackathon', 'Kata Camp', 'Additional']
  end
end
