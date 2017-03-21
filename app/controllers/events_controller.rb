class EventsController < ApplicationController
  before_action :authorize!

  def index
    @events = GithubOauth.events(@current_user)
  end

end
