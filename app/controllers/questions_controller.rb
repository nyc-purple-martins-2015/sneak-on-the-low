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

  def edit
    @question = Question.find(params[:id])
    @tags = @question.tags
    render :edit
  end

  def update
    @question = Question.find(params[:id])
    if @question.update_attributes(question_params)
      if tag_params != nil
        Tag.seperate_new_tags(tag_params[:name], @question)
      end
      redirect_to root_path
    else
      render :edit
    end
  end

  def destroy
    @question = Question.find(params[:id])
    @question.destroy
    redirect_to root_path
  end

  def show
    @question = Question.includes(:answers).includes(:comments).find(params[:id])
    @best_answer = @question.answers.where(:best => true)
  end

  private

  def question_params
    question_params = params.require(:question).permit(:title, :content, :user_id)
  end

  def tag_params
    params.require(:question).require(:tag).permit(:name)
  end


end
