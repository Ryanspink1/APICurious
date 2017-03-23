class ApplicationController < ActionController::Base
  protect_from_forgery with: :exception
  helper_method :current_user, :client_secret, :client_id

  def current_user
    @current_user ||= User.find(session[:user_id]) if session[:user_id]
  end

  def client_secret
    @client_secret ||= open('lib/assets/.client_secret').read.gsub("\n","")
  end

  def client_id
    @client_id ||= open('lib/assets/.client_id').read.gsub("\n","")
  end

  def authorize!
    unless current_user
      redirect_to root_path
    end
  end
end
