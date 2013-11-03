class ApplicationController < ActionController::Base
  # Prevent CSRF attacks by raising an exception.
  # For APIs, you may want to use :null_session instead.
  protect_from_forgery with: :exception

  protected
    def authenticate_admin
      authenticate_or_request_with_http_basic do |user, pass|
        user == ENV['BASIC_AUTH_USER'] && pass == ENV['BASIC_AUTH_PASSWORD']
      end
    end
end
