class AddDiscussibleToForumThreads < ActiveRecord::Migration
  def change
    add_reference :forum_threads, :discussible, polymorphic: true, index: true
  end
end
