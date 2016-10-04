class Result < ApplicationRecord
  belongs_to :lesson
  belongs_to :question
  belongs_to :answer

  class << self
    def count_correct_answer user
      count_word = 0;
      user.lessons.each do |lesson|
        lesson.results.each do |result|
          count_word += 1 if result.answser.is_correct && result.answser
        end
      end
      count_word
    end
  end

end
