class LogEntry < ActiveRecord::Base
  belongs_to :user
  belongs_to :microtask

  default_scope order("created_at DESC")

end
