class Grade < ActiveRecord::Base
  belongs_to :user
  belongs_to :movie

  validates :value, numericality: { only_integer: true, greater_than: 0, less_than_or_equal_to: 10 }
  validates :movie, :user, presence: true
  validates :movie_id, uniqueness: { scope: :user_id }
end
