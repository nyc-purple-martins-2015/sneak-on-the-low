class CommentsController < ApplicationController

  def new
    @comment = Comment.new(new_comment_params)
    render layout: false
  end

  def create
    @comment = Comment.new(comment_params)
    if @comment.save
      redirect_to question_path(cur_question)
    else
      redirect_to question_path(cur_question)
    end
  end

  private

  def new_comment_params
    params.require(:comment).permit(:user_id, :commentable_id, :commentable_type)
  end

  def cur_question
    if params[:comment][:commentable_type] == "Question"
      return @comment.commentable_id
    else
      return @comment.commentable.question.id
    end
  end

  def comment_params
    params.require(:comment).permit(:content, :commentable_id, :commentable_type, :user_id)
  end
end
