class PullsController < ApplicationController
  before_action :authorize!
  
  def index
    @pulls = Pull.find_pulls(current_user)
  end
end
