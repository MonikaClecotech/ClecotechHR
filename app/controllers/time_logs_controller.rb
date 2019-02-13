class TimeLogsController < ApplicationController
  
  def index
    @users = User.with_role :employee
  end 

  def sign_out 
    @attendence = current_user.time_logs.last
    @attendence.update(:out_time => Time.now) 
    redirect_to root_path 
  end

  def sign_in
    @user = current_user
    @attendence = @user.time_logs.create(:user_id => @user.id , :in_time => Time.now)
  end

end
