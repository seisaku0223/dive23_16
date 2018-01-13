class AnswersController < ApplicationController
  before_action :set_answer, only:[:edit, :update, :destroy]

  def create
    @answer = current_user.answers.build(answer_params)
    @question = @answer.question
    respond_to do |format|
      if @answer.save
        format.html { redirect_to question_path(@question) }
        format.js{ render :index }
      else
        format.js{ render :form }
      end
    end
  end

  def destroy
    set_answer
    @answer.destroy
    respond_to do |format|
      if @answer.save
        format.html { redirect_to question_path(@question) }
        format.js{ render :index }
      else
        format.html{ render :new }
      end
    end
  end

  def edit
    set_answer
  end

  def update
    set_answer
    if @answer.update(answer_params)
      redirect_to question_path(@question)
    else
      render 'edit'
    end
  end

  private
    def answer_params
      params.require(:answer).permit(:question_id, :content)
    end

    def set_answer
      @answer = Answer.find(params[:id])
      @question = @answer.question
    end
end
