class QuestionsController < ApplicationController
  before_action :authenticate_user!, except: :show
  before_action :set_question, only: [:show, :edit, :update, :destroy]

  def show
    respond_with @question
  end

  def new
    respond_with @question = Question.new
  end

  def edit
    respond_with @question
  end

  def create
    respond_with @question = current_user.questions.create(question_params)
  end

  def update
    @question.update(question_params)
    respond_with @question
  end

  def destroy
    @question.destroy

    respond_with @question.destroy
  end

  private

  def set_question
    @question = current_user.questions.find(params[:question_id]).join(:answers)
  end

  def question_params
    params[:question].permit(:title, :body)
  end

end
