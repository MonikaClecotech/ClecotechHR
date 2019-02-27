class DashboardController < ApplicationController
  before_action :authenticate_user!
  def index
  end

  def users
  end

  def pretty_duration
    seconds = self % 60
    minutes = (self / 60) % 60
    hours   = self / (60 * 60)

    format('%02d:%02d:%02d', hours, minutes, seconds)
  end
  
end
