class User < ActiveRecord::Base
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable

  mount_uploader :avatar, AvatarUploader

  has_many :questions
  has_many :votes, foreign_key: 'user_id', dependent: :destroy
  has_many :vote_questions, through: :votes, source: :question

  # def already_voted?(question)
  #   self.votes.exists?(question_id: question.id)
  # end
end
