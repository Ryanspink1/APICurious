class FollowersController < ApplicationController
  before_action :authorize!

  def index
    @followers = Follower.find_by(current_user)
  end
end
