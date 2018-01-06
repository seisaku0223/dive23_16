class User < ActiveRecord::Base
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable

  mount_uploader :avatar, AvatarUploader

  has_many :questions
  has_many :votes, foreign_key: 'user_id', dependent: :destroy
  has_many :vote_questions, through: :votes, source: :question
  has_many :favorites, dependent: :destroy

  def already_voted?(question)
    self.votes.exists?(question_id: question.id)
  end

  def favorite!(specified_question)
    favorites.create!(question_id: specified_question.id)
  end

  def favoriteing?(specified_question)
    favorites.find_by(question_id: specified_question.id)
  end

  def unfavorite!(specified_question)
    favorites.find_by(question_id: specified_question.id).destroy
  end

  # def already_voted?(question)
  #   self.votes.exists?(question_id: question.id)
  # end
end
