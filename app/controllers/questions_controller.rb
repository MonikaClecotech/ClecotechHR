class QuestionsController < ApplicationController
before_action :check_role

  def new
    @question = Question.new
  end

  def create
    @question = Question.new(question_params)
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

private

  def question_params
    params.require(:question).permit(:title, :question_type)
  end

  def check_role
    unless current_user.has_role?(:HR) || current_user.has_role?(:admin)
      redirect_to root_path
    end 
  end

end
