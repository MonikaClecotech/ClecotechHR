class SurveysController < ApplicationController
  
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

end
