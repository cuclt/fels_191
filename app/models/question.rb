class Question < ApplicationRecord
  belongs_to :category
  has_many :answers
  has_many :results
  has_many :lessons, through: :results
  scope :random, ->{order "RANDOM()"}
  scope :newest, ->{order created_at: :desc}
  scope :search_name, ->search do
    where "name LIKE ?", "%#{search}%" if search.present?
  end
end
