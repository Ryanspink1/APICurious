class CommitsController < ApplicationController
  before_action :authorize!

  def index
    @commits = Commit.order_commits(current_user)
  end
end
