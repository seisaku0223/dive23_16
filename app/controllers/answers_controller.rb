class AnswersController < ApplicationController
  def create
    @answer = current_user.answers.build(answer_params)
    @question = @answer.question
    respond_to do |format|
      if @answer.save
        format.html { redirect_to question_path(@question) }
        format.js{ render :index }
      else
        format.html { render :new }
      end
    end
  end

  def destroy
    @answer = Answer.find(params[:id])
    @question = @answer.question
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
  end

  def update
  end


  private
    def answer_params
      params.require(:answer).permit(:question_id, :content)
    end
end
