class ReposController < ApplicationController
  before_action :authorize!
  
  def index
    @repos = Repo.find_by(current_user)
  end

  def new
  end

  def create
    Repo.create_repo(current_user, params[:name])
    redirect_to repos_path
  end
end
