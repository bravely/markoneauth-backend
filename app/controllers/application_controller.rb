class ApplicationController < ActionController::Base
  before_action :authenticate_user_from_token!
  before_action :authenticate_user!

  respond_to :json

  # Prevent CSRF attacks by raising an exception.
  # For APIs, you may want to use :null_session instead.
  protect_from_forgery with: :null_session

  private

  def authenticate_user_from_token!
    authenticate_with_http_token do |token, options|
      user_email = options[:user_email].presence
      user = user_email && User.find_by_email(user_email)

      sign_in user, store: false if user && Devise.secure_compare(user.authentication_token, token)
    end
  end
end
