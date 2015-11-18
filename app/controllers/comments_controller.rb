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

  def edit
    @comment = Comment.find(params[:id])
  end

  def update
    @comment = Comment.find(params[:id])
    if @comment.update_attributes(comment_params)
      redirect_to question_path(cur_question)
    else
      render :edit
    end
  end

  def destroy
    @comment = Comment.find(params[:id])
    @question = @comment.commentable_type == "Question" ? @comment.commentable : @comment.commentable.question
    @comment.destroy
    redirect_to question_path(@question)
  end

  private

  def new_comment_params
    params.require(:comment).permit(:commentable_id, :commentable_type).merge(commentor: current_user)
  end

  def cur_question
    if params[:comment][:commentable_type] == "Question"
      return @comment.commentable_id
    else
      return @comment.commentable.question.id
    end
  end

  def comment_params
    params.require(:comment).permit(:content, :commentable_id, :commentable_type).merge(commentor: current_user)
  end
end
