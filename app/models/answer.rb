class Answer < ApplicationRecord
  belongs_to :question
  has_many :results
  has_many :lessons, through: :results
end
