class Answer < ActiveRecord::Base
  belongs_to :user
  belongs_to :question
  validates :content, presence: true, length: { minimum: 1, maximum: 1000 }
end
