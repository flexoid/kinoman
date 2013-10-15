class Forum::Thread < ActiveRecord::Base
  belongs_to :author, class_name: 'User'
  belongs_to :category
  has_many :messages

  validates :title, :author, :category, presence: true
end
