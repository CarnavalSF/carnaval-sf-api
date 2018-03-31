class ApplicationController < ActionController::Base
  include CurrentUser

  protect_from_forgery with: :exception

  # Configure additonal flash message types.
  add_flash_types :success, :error
end
