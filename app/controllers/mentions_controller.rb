class MentionsController < ApplicationController
  before_action :authorize!

  def index
    @mentions = Mention.find_by(current_user)
  end
end
