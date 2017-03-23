class FollowingController < ApplicationController
  before_action :authorize!

  def index
    @following = Following.find_by(current_user)
  end
end
