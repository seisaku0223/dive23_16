class UsersController < ApplicationController
  def index
    @users = User.page(params[:page]).per(20)
  end

  def show
    @user = User.find(params[:id])
    @check_list = params[:check_list].presence

    if @check_list.blank? || @check_list == "質問一覧"
      questions_data = Question.where(user_id: params[:id])
      @questions = questions_data.page(params[:page]).per(20)
      @check_list = "質問一覧"
    elsif @check_list == "お気に入り一覧"
      favorites_data = Favorite.where(user_id: params[:id])
      @favorites = favorites_data.page(params[:page]).per(20)
    else
      @question = Question.where(user_id: params[:id])
      @answers = Answer.where(user_id: params[:id])
    end
  end
end
