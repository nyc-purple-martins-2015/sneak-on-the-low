class QuestionsController < ApplicationController

  def index
    @questions = Question.all
  end


  def show
    @question = Question.includes(:answers).includes(:comments).find(params[:id])
  end
end
