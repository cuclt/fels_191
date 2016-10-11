class Question < ApplicationRecord
  belongs_to :category
  has_many :answers
  has_many :results
  validates :name, presence: true
  has_many :lessons, through: :results

  scope :random, ->{order "RANDOM()"}
  accepts_nested_attributes_for :answers, allow_destroy: true
end
