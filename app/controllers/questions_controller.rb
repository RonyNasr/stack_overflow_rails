class QuestionsController < ApplicationController
  def new
    @question = Question.new
  end
  def show
    @question = Question.find(params[:id])
    @answer = Answer.new
  end

  def index
    @questions = Question.all
  end

  def create
    @question = current_user.questions.new(question_params)
    if @question.save
      redirect_to root_url
    else
      flash[:notice] = "Error!"
      render :new
    end
  end

  private

  def question_params
    params.require(:question).permit(:title, :content)
  end
end
