class ApplicationController < ActionController::Base
  # Prevent CSRF attacks by raising an exception.
  # For APIs, you may want to use :null_session instead.
  protect_from_forgery with: :exception

  before_filter :initialize_user
  before_filter :configure_permitted_parameters, if: :devise_controller?

  private

    def initialize_user
      @sign_in_user = User.new
    end

    def configure_permitted_parameters
      devise_parameter_sanitizer.for(:sign_up) << :username
    end

    def add_breadcrumb(text, url)
      @breadcrumbs ||= []
      @breadcrumbs << [text, url]
    end
end
