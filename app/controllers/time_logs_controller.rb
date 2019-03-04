class TimeLogsController < ApplicationController
  before_action :check_role, except: [:sign_in, :sign_out]

  def index
    @date = params[:time]
    @users = User.with_role :employee
  end 
  
  def edit
    @time = TimeLog.find(params[:id])
  end

  def update
    @time = TimeLog.find(params[:id])
    redirect_to root_path and return if current_user.id == @time.try(:user).try(:id)
    if @time.update(:out_time => params[:time_log][:out_time])
      flash[:success] = "Successfully Updated"
      redirect_to time_logs_path
    else
      flash[:success] = "Something is wrong..try later"
      redirect_to time_logs_path
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

  # def view
  #   @user = User.find(params[:user])
  # end

private
  
 def salary_transaction_params
  params.require(:time_log).permit(:in_time, :out_time, :user_id)
 end

 def check_role
  unless current_user.has_role?(:HR) || current_user.has_role?(:admin)
    redirect_to root_path
  end 
 end

end
