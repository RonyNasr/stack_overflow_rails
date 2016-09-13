class AnswersController < ApplicationController

  def new

  end

  def create
    @question = Question.find(params[:question_id])
    @answer = @question.answers.new(answer_params)
    @answer.user_id = current_user.id
    if @answer.save
      flash[:notice]="We're sure youre right but we'll let the votes decides"
      redirect_to question_path(@question)
    else
      flash[:notice]="We're sure youre right but that didnt work"
      redirect_to question_path(@question)
    end
  end

  def update
    @question = Question.find(params[:question_id])
    @answer = Answer.find(params[:id])
    @answer.liked_by current_user
  end

  private

  def answer_params
    params.require(:answer).permit(:content)
  end
end
