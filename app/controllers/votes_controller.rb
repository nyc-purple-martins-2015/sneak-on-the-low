class VotesController < ApplicationController
  def create
    @vote = Vote.create!(vote_params)
    redirect_to question_path(@vote.voteable_id)
  end

  private
  def vote_params
    params.require(:vote).permit(:user_id, :value, :voteable_id, :voteable_type)
  end

end
