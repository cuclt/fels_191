class Category < ApplicationRecord
  has_many :lessons
  has_many :questions
  scope :newest, -> {order created_at: :desc}
end
