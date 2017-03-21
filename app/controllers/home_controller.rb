class HomeController < ApplicationController
  def show
    @client_id = GithubOauth.client_id
  end
end
