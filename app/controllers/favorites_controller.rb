class FavoritesController < ApplicationController
  before_action :authenticate_user!
  respond_to :js

  def create
    @question = Question.find(params[:favorite][:question_id])
    current_user.favorite!(@question)
    respond_with @question
  end

  def destroy
    @question = Favorite.find(params[:id]).question
    current_user.unfavorite!(@question)
    respond_with @question
  end
end
