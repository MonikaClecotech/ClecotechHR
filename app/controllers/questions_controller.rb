class QuestionsController < ApplicationController
before_action :check_role, except: [:question_form, :index]

  def new
    @survey = Survey.find(params[:survey_id])
    @question = Question.new
  end

  def create
    @survey = Survey.find(params[:survey_id])
    @question = @survey.questions.new(question_params)
    if @question.save
      flash[:success] = "Question successfully created"
      redirect_back fallback_location: request.referer
    else
      flash[:notice] = "Try later"
      redirect_back fallback_location: request.referer
    end
  end

  def show
  end

  def index
    @questions = Question.all
  end

  def edit
    @question = Question.find(params[:id])
  end

  def update
    @question = Question.find(params[:id])
    if @question.update(question_params)
      flash[:success] = "Successfully updated"
      redirect_to questions_path
    else
      flash[:notice] = "Try later"
      redirect_back fallback_location: request.referer
    end
  end

  def destroy
    @question = Question.find(params[:id])
    if @question.destroy
      flash[:success] = "Successfully deleted"
      redirect_back fallback_location: request.referer
    else
      flash[:notice] = "Try later"
      redirect_back fallback_location: request.referer
    end
  end

  def answer
    @question = Question.all
  end

  def question_form
    @questions = Question.where(:survey_id => params[:format])
  end

private

  def question_params
    params.require(:question).permit(:title, :question_type, :survey_id)
  end

  def check_role
   redirect_to root_path unless current_user.has_role? :admin 
  end

end
