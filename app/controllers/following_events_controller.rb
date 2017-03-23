class FollowingEventsController < ApplicationController
  before_action :authorize!

  def index
    @following_events = Following.following_events(current_user)
  end
end
