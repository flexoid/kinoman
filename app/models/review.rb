class Review < ActiveRecord::Base
  belongs_to :movie
  belongs_to :user

  validates :movie, :user, :title, :content, presence: true
end
