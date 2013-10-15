class Forum::Message < ActiveRecord::Base
  belongs_to :thread
  belongs_to :author, class_name: 'User'

  validates :content, :thread, :author, presence: true
end
