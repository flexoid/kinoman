class Forum::Thread < ActiveRecord::Base

  belongs_to :author, class_name: 'User'
  belongs_to :category
  belongs_to :discussible, polymorphic: true
  has_many :messages, dependent: :destroy

  validates :title, :author, :category, presence: true
end
