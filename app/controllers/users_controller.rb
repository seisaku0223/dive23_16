class UsersController < ApplicationController
  def index
    @users = User.all
  end

  def show
    @user = User.find(params[:id])
    @check_list = params[:check_list].presence

    if @check_list.blank? || @check_list == "質問一覧"
      @questions = Question.where(user_id: params[:id])
      @check_list = "質問一覧"
    elsif @check_list == "お気に入り一覧"
      @favorites = Favorite.where(user_id: params[:id]) if @check_list == "お気に入り一覧"
    else
      @question = Question.where(user_id: params[:id])
      @answers = Answer.where(user_id: params[:id])
    end
  end
end
