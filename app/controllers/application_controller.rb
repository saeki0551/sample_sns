class ApplicationController < ActionController::Base
  # Only allow modern browsers supporting webp images, web push, badges, import maps, CSS nesting, and CSS :has.
  allow_browser versions: :modern

  before_action :ensure_html_format
  
  private

  def ensure_html_format
    request.format = :html if request.format.nil? || request.format.json?
  end
      
end
