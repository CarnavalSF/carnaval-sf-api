module Authorize
  extend ActiveSupport::Concern

  included do
    before_action :authorize
  end

  private

  def authorize
    redirect_to root_url, error: 'Please log in first.' unless current_user
  end
end
