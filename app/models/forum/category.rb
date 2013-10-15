class Forum::Category < ActiveRecord::Base
  PEOPLE_DISCUSSION_TITLE = 'People discussion'
  MOVIES_DISCUSSION_TITLE = 'Movies discussion'
  ADMIN_EMAIL             = 'admin@example.com'

  has_many :threads

  validates :title, presence: true
end
