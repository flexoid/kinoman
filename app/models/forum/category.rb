class Forum::Category < ActiveRecord::Base
  ADMIN_EMAIL             = 'admin@example.com'

  has_many :threads

  validates :title, presence: true
end
