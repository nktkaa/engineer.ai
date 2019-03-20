class DasboardController < ApplicationController
  def index
    @questions = Question.last(20)
  end
end
