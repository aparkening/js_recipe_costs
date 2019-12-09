class ApplicationController < ActionController::API
  # include ActionController::Cookies
  # include ActionController::RequestForgeryProtection

  # protect_from_forgery with: exception

  # before_action :set_csrf_cookie


  ### Write validation methods from https://www.youtube.com/watch?v=qjtht03t7z4&feature=youtu.be @ 1 hour


  private

  def set_csrf_cookie
    cookies["CSRF-TOKEN"] = form_authenticity_token
  end

end
