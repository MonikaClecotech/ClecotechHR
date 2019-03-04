class ApplicationController < ActionController::Base
  # before_action :premises_auhtorization  

  layout :layout_by_resource
  
  def layout_by_resource
    if devise_controller? and !user_signed_in?
      'landing'
    else
      'application'
    end
  end

  # def premises_auhtorization
  # 	unless %w(122.168.88.100 125.99.165.4).include?(request.remote_ip)
  # 		redirect_to "/404.html" and return
  # 	end
  # end
end
