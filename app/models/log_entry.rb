class LogEntry < ActiveRecord::Base
  belongs_to :user
  belongs_to :microtask

end
