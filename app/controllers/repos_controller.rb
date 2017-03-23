class ReposController < ApplicationController
  before_action :authorize!

  def index
    @repos = Repo.find_by(current_user)
  end
end
