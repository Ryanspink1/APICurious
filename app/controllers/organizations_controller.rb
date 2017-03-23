class ReposController < ApplicationController
  before_action :authorize!

  def index
  @organizations = Organization.find_by(current_user)
  end

end
