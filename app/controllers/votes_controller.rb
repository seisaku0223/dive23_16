class VotesController < ApplicationController
  before_action :authenticate_user!, only: [:create, :destroy]
  before_action :set_question

  def create
    @vote = Vote.new(
      question_id: params[:question_id],
      user_id: current_user.id
    )

    if @vote.save
      redirect_to question_path(@question)
    else
      redirect_to question_path(@question), notice: '同じ質問に２回答票することはできません'
    end
  end

  def destroy
    @vote = Vote.find_by(question_id: params[:question_id], user_id: current_user.id)
    if @vote
      @vote.destroy
      redirect_to question_path(@question)
    else
      redirect_to question_path(@question), notice: '投票をしていないため取り消し出来ません'
    end
  end

  private

  def vote_params
    params.require(:vote).permit(:question_id, :user_id)
  end

  def set_question
    @question = Question.find(params[:question_id])
  end

end
