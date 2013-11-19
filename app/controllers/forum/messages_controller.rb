class Forum::MessagesController < ApplicationController

  load_and_authorize_resource :thread, class: 'Forum::Thread'
  before_action :new_message
  load_and_authorize_resource through: :thread

  respond_to :html

  def create
    @message.update_attributes(message_params)
    respond_with(@message, location: forum_thread_path(@thread))
  end

  private

    def message_params
      params.require(:forum_message).permit!
    end

    def new_message
      @message = Forum::Message.new(message_params.merge(author_id: current_user.id, thread_id: @thread.id))
    end
end
