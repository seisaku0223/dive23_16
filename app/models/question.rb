class Question < ActiveRecord::Base
  belongs_to :user
  has_many :votes, dependent: :destroy
  has_many :vote_users, through: :votes, source: :user
  has_many :favorites, dependent: :destroy
  has_many :favorite_users, through: :favorites, source: :user
  acts_as_taggable

  validates :title, presence: true, length: { minimum: 1, maximum: 100 }
  validates :content, presence: true, length: { minimum: 1, maximum: 1000 }

  def rank
    ranking = Question.all.collect do |question|
      question.votes.count
    end

    self_votes_count = self.votes.count

    high_rank_questions = ranking.keep_if do |votes_count|
      votes_count > self_votes_count
    end

    return high_rank_questions.count + 1
  end

  def self.top5
    ranking = Question.all.sort_by do |question|
      question.rank
    end

    ranking = ranking.keep_if do |question|
      question.rank <= 5
    end

    return ranking
  end

end
