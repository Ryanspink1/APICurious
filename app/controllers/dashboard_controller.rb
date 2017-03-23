class DashboardController < ApplicationController
  before_action :authorize!
  def show
    # @basic_info    = Basic.find_by(current_user)
    @commits          = Commit.order_commits(current_user)
    # @commit2        = Event.find_recent_commits(current_user)
    @starred_count    = Starred.find_by(current_user)
    # binding.pry
  end
end
