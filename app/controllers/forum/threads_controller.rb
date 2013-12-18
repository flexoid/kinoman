class Forum::ThreadsController < ApplicationController

  load_and_authorize_resource

  def show
    @new_message = Forum::Message.new(author_id: current_user.id, thread_id: @thread.id) if current_user
  end
end
