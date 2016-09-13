class User < ApplicationRecord
  has_secure_password
  has_many :questions
  has_many :answers
  validates_uniqueness_of :email
end
