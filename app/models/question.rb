class Question < ActiveRecord::Base
  belongs_to :user
  has_many :votes, foreign_key: 'question_id', dependent: :destroy
  has_many :vote_users, through: :votes, source: :user
  has_many :favorites, dependent: :destroy
  has_many :favorite_users, through: :favorites, source: :user
  acts_as_taggable
end
