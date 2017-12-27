class Question < ActiveRecord::Base
  belongs_to :user
  has_many :votes, dependent: :destroy
  has_many :vote_users, through: :votes, source: :user
end
