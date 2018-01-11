class Question < ActiveRecord::Base
  attr_accessor :earned_votes
  belongs_to :user
  has_many :votes, dependent: :destroy
  has_many :vote_users, through: :votes, source: :user
  has_many :favorites, dependent: :destroy
  has_many :favorite_users, through: :favorites, source: :user
  acts_as_taggable
  has_many :answers, dependent: :destroy

  validates :title, presence: true, length: { minimum: 1, maximum: 100 }
  validates :content, presence: true, length: { minimum: 1, maximum: 1000 }

  def self.rank
    questions = Question.all.includes(:votes).each do |question|
      question.earned_votes = question.votes.size
    end
    return questions.sort_by {|question| question.earned_votes}.reverse
  end

end
