class SurveysController < ApplicationController
  before_action :check_role 
  
  def index
    @surveys = Survey.all
  end

  def new
    @survey = Survey.new
  end

  def create
    @survey = Survey.new(survey_params)
    if @survey.save
      flash[:success] = "survey successfully created"
      redirect_back fallback_location: request.referer
    else
      flash[:notice] = "Try later"
      redirect_back fallback_location: request.referer
    end
  end

private
  
  def survey_params
    params.require(:survey).permit(:name)
  end
   
  def check_role
    redirect_to root_path unless current_user.has_role? :admin 
  end

end
