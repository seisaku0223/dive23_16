class Question < ActiveRecord::Base
  belongs_to :user
  has_many :votes, foreign_key: 'question_id', dependent: :destroy
  has_many :vote_users, through: :votes, source: :user
  acts_as_taggable

  validates :title, presence: true, length: { minimum: 1, maximum: 100 }
  validates :content, presence: true, length: { minimum: 1, maximum: 1000 }
end
