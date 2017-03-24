class DashboardController < ApplicationController
  before_action :authorize!
  def show
    @commits          = Commit.order_commits(current_user)
    @starred_count    = Starred.find_by(current_user)
    # binding.pry
  end
end
