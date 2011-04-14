module TaskHelper

  def microtask_processed(microtask)
   microtask.status == "Accepted" || microtask.status == "Submitted"
  end

  def microtask_accepted?(microtask)
   microtask.status == "Accepted"
  end

end
