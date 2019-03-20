class AnswersController < ApplicationController

  before_action :authenticate_user!
  before_action :set_answer, only: [:edit, :update, :destroy]

  def new
    respond_with @answer = Answer.new
  end

  def edit
    respond_with @answer
  end

  def create
    @answer = current_user.answers.create(answer_params)
    respond_with @answer
  end

  def update
    @answer.update(answer_params)
    respond_with @answer
  end

  def destroy
    @answer.destroy

    respond_with @answer.destroy
  end

  private

  def set_answer
    @answer = current_user.answers.find(params[:question_id]).join(:answers)
  end

  def answer_params
    params[:answer].permit(:question_id, :body)
  end
  
end
