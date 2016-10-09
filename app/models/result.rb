class Result < ApplicationRecord
  belongs_to :lesson
  belongs_to :question
  belongs_to :answer
  belongs_to :user

  scope :correct_anwsers, -> do
    joins(:answer).where("answers.is_correct = ?", true)
  end
  class << self
    def search search
      if search
        joins("INNER JOIN lessons ON results.lesson_id = lessons.id").where "lessons.category_id = ?", search
      else
        correct_anwsers
      end
    end
  end
end
