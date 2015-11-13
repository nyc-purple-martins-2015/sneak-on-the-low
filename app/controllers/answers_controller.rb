class AnswersController < ApplicationController
  def new
    @answer = current_user.answers.new
  end

  def create
    @answer = current_users.answers.new(answer_params)
    if @answer.save
      redirect_to root_path
    else
      render :new
    end
  end

  private

  def answer_params
    answer_params = params.require(:answer).permit(:content)
  end
end
