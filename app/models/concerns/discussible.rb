module Discussible
  extend ActiveSupport::Concern

  included do
    has_one :thread, as: :discussible, class_name: 'Forum::Thread'
    after_create :create_forum_thread
  end

  def create_forum_thread
    unless thread.present?
      category = Forum::Category.where(title: forum_category).first
      user = User.where(email: Forum::Category::ADMIN_EMAIL).first
      if category && user
        create_thread!(title: forum_thread_name, author: user, category: category)
      end
    end
  end
end
