class ApplicationController < ActionController::Base
  layout :layout_by_resource
  def layout_by_resource
    if devise_controller? and !user_signed_in?
      'landing'
    else
      'application'
    end
  end
end
