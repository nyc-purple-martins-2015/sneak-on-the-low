class QuestionsController < ApplicationController

  def index
    @questions = Question.all
  end

  def new
    @question = Question.new
  end

  def create
    @question = Question.new(question_params)
    if @question.save
      redirect_to question_path(@question)
    else
      #flash error message
      render :new
    end
  end

  def show
    @question = Question.includes(:answers).includes(:comments).find(params[:id])
  end

  private
  def question_params
    question_params = params.require(:question).permit(:title, :content, :user_id)
  end

end
