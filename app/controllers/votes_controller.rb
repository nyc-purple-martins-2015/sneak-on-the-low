class VotesController < ApplicationController
  def create
    @vote = Vote.create!(vote_params)
    redirect_to question_path(cur_question)
  end

  private
  def vote_params
    params.require(:vote).permit(:user_id, :value, :voteable_id, :voteable_type)
  end

  def cur_question
    if params[:vote][:voteable_type] == "Question"
      return @vote.voteable_id
    else
      return params[:question_id]
    end
  end
end
