class Review < ActiveRecord::Base
  belongs_to :movie
  belongs_to :user

  validates :movie, :user, :content, presence: true

  # scope :approved, -> { where(approved: true) }
  scope :approved, -> { scoped }
end
