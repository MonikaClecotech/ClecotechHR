class TimeLogsController < ApplicationController
  before_action :check_role, except: [:sign_in, :sign_out]

  def index
    @date = params[:time]
    if current_user.has_role? (:HR)
      @users = User.with_role :employee
    else
      flash[:success] = "Sorry you are not authorize to access this portal"
      redirect_to root_path
    end
  end 

  def sign_out 
    @attendence = current_user.time_logs.last
    @attendence.update(:out_time => Time.now)
    flash[:success] = "Successfully Sign Out" 
    redirect_to root_path 
  end

  def sign_in
    @user = current_user
    @attendence = @user.time_logs.create(:user_id => @user.id , :in_time => Time.now)
    flash[:success] = "Successfully Sign In" 
    redirect_to root_path 
  end

  def user
    @user = User.find(params[:user])
  end

  def view
    @user = User.find(params[:user])
  end

private
  
 def check_role
   redirect_to root_path unless current_user.has_role? :HR 
 end

end
