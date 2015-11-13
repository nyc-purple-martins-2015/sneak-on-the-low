class QuestionsController < ApplicationController

  def index
    @questions = Question.all
  end

  def new
    @question = Question.new
    @tag = Tag.new
  end

  def create
    if current_user
      @question = Question.new(question_params)
      if @question.save
        if tag_params != nil
          Tag.seperate_tags(tag_params[:name], @question)
          tags = @question.tags.new(tag_params)
        end
        redirect_to question_path(@question)
      else
       #flash error message
        render :new
      end
    else
      #flash error message
      redirect_to login_path
    end
  end

  def show
    @question = Question.includes(:answers).includes(:comments).find(params[:id])
  end

  private

  def question_params
    question_params = params.require(:question).permit(:title, :content, :user_id)
  end

  def tag_params
    params.require(:question).require(:tag).permit(:name)
  end


end
