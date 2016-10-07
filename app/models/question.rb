class Question < ApplicationRecord
  belongs_to :category
  has_many :answers
  has_many :results
  has_many :lessons, through: :results
  scope :random, ->{order "RANDOM()"}
end
