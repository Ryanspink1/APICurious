class EventsController < ApplicationController
  before_action :authorize!

  def index
    @events = Event.find_by(current_user)
  end
end
