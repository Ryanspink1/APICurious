class PullsController < ApplicationController
  before_action :authorize!

  def index
    @pulls = GithubOauth.pulls(@current_user, client_id, client_secret)
    binding.pry
  end

end
