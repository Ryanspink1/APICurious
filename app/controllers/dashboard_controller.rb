class DashboardController < ApplicationController
  before_action :authorize!
  def show
    # @basic_info    = Basic.find_by(current_user)
    @commits       = Commit.order_commits(current_user)
    # @commit2       = Event.find_recent_commits(current_user)
    @following_events = Following.following_events(current_user)
    @starred_count = Starred.find_by(current_user)
    @following     = Following.find_by(current_user)
    @followers     = Follower.find_by(current_user)
    @pulls         = Pull.find_pulls(current_user)
  end
end
