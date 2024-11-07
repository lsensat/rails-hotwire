class ApplicationController < ActionController::Base

  # before_action -> { sleep 3 }
  before_action :authenticate_user!, unless: :devise_controller?
end
