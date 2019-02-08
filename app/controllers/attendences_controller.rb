class AttendencesController < ApplicationController
  
  def sign_out 
    @attendence = current_user.attendences.last
    @attendence.update(:out_time => Time.now) 
    redirect_to root_path 
  end

end
