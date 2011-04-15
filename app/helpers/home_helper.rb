module HomeHelper

  def log_entry_message(entry)
    if current_user.type == "Requester"
      return "#{entry.message} #{entry.microtask.name}" if entry.message == "Created"
      return "#{entry.microtask.name}'s Tranlation By #{entry.user.name} #{entry.message}" if entry.message == "Accepted"
      return "#{entry.user.name} Started #{entry.message} #{entry.microtask.name}" if entry.message == "Processing"
      return "#{entry.user.name} #{entry.message} #{entry.microtask.name}" if entry.message == "Submitted"
      return "#{entry.microtask.name} #{entry.message}" if entry.message == "Rejected"
    else
      return "#{entry.microtask.name} #{entry.message} By #{entry.microtask.task.requester.name}" if entry.message == "Accepted" || entry.message == "Rejected"
      return "Started #{entry.message} #{entry.microtask.name}" if entry.message == "Processing"
      return "#{entry.microtask.name} #{entry.message}" if entry.message == "Submitted"
    end
      return entry.message
  end

  def formatted_time(time)
    time.localtime.strftime("On %m/%d/%Y  at %I:%M%p")
  end
end
