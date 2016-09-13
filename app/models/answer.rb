class Answer < ApplicationRecord

  belongs_to :user
  acts_as_votable
  belongs_to :question

  validates :content, :presence => true

end
