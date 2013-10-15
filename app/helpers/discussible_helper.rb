module DiscussibleHelper

  def thread_status(thread)
    messages_count = thread.messages.count
    messages_count == 0 ? "Be first!" : "#{messages_count} #{"message".pluralize(messages_count)}"
  end
end
