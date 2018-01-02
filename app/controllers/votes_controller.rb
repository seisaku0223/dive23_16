class VotesController < ApplicationController
  before_action :authenticate_user!, only: [:create, :destroy]
  def create
    @question = Question.find(params[:question_id])
    @vote = Vote.new(
      question_id: params[:question_id],
      user_id: current_user.id
    )

    if @vote.save
      redirect_to question_path(@question)
    else
      render template: 'questions/show'
    end
  end

  def destroy
    @vote = Vote.find_by(question_id: params[:question_id], user_id: current_user.id)
    @vote.destroy
    redirect_to question_path(params[:question_id])
  end

  private
    def vote_params
      params.require(:vote).permit(:question_id, :user_id)
    end
end
