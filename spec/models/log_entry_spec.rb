require 'spec_helper'

describe LogEntry do
  it { should belong_to :user }
  it { should belong_to :microtask }
end
