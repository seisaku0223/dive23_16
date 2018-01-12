class FavoritesController < ApplicationController
  before_action :authenticate_user!
  respond_to :js

  def create
    @question = Question.find(params[:favorite][:question_id])
    current_user.favorite!(@question)
    @favorite_count = Favorite.where(question_id: params[:favorite][:question_id]).count
    respond_with @question
  end

  def destroy
    @question = Favorite.find(params[:id]).question
    count_id = @question.id
    current_user.unfavorite!(@question)
    @favorite_count = Favorite.where(question_id: count_id).count
    respond_with @question
  end
end
