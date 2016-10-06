class Result < ApplicationRecord
  belongs_to :lesson
  belongs_to :question
  belongs_to :answer
  belongs_to :user

  scope :correct_anwsers, -> do
    joins(:answer).where("answers.is_correct = ?", true)
  end
end
