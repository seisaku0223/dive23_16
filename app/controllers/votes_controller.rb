class VotesController < ApplicationController
  def create
    vote = current_user.votes.create(question_id: params[:question_id])
    redirect_to questions_url, notice: "#{vote.question.user.name}さんの質問に投票しました"
  end

  def destroy
    vote = current_user.votes.find_by(question_id: params[:question_id]).destroy
    redirect_to questions_url, notice: "#{vote.question.user.name}さんへの投票を取り消しました"
  end
end
