# frozen_string_literal: true

class ApplicationController < ActionController::Base
  protect_from_forgery with: :exception

  rescue_from RuntimeError do |exception|
    Rails.logger.error exception.message
    redirect_to root_url, alert: exception.message
  end
end
