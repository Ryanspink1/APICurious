class CommitsController < ApplicationController
  before_action :authorize!

  def index
    @commits = Commit.find_by(current_user)
  end
end
