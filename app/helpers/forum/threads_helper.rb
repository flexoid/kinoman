module Forum::ThreadsHelper

  def last_message(thread)
    last = thread.messages.last
    last ? t(last.created_at) : 'N/A'
  end
end
