class AnswersController < ApplicationController
  def new
    @answer = Answer.new
    @question_id = params[:question_id]
    render layout: false
  end

  def create
    @answer = current_user.answers.new(answer_params)
    if @answer.save
      redirect_to question_path(@answer.question)
    else
      render :new
    end
  end

  def edit
    @answer = Answer.find(params[:id])
  end

  def update
    @answer = Answer.find(params[:id])
    if @answer.update_attributes(answer_params)
      redirect_to question_path(@answer.question)
    else
      render :best
    end
  end

  def destroy
    @answer = Answer.find(params[:id])
    @question = @answer.question
    @answer.destroy
    redirect_to question_path(@question)
  end

  private

  def answer_params
    answer_params = params.require(:answer).permit(:content, :question_id, :best)
  end
end
