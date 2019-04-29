class QuestionOptionsController < ApplicationController
  
  def create
    @question = Question.find(params[:question_id])
    @question_type = @question.question_options.build(question_option_params)
    if @question_type.save
      redirect_back fallback_location: request.referer
    else
      redirect_back fallback_location: request.referer
    end
  end

  def show
  end

  def index
  end

private
 
  def question_option_params
    params.require(:question_option).permit(:answer, :user_id, :question_id)
  end

end
