require 'spec_helper'

describe Microtask do
  it { should belong_to :task }
  it { should belong_to :translator }
  it { should validate_presence_of :paragraph }
  it { should validate_presence_of :points }
  it { should validate_presence_of :task }
  it { should validate_presence_of :paragraph_index }
end




# == Schema Information
#
# Table name: microtasks
#
#  id                   :integer         not null, primary key
#  task_id              :integer
#  translator_id        :integer
#  points               :float
#  paragraph            :text
#  created_at           :datetime
#  updated_at           :datetime
#  paragraph_index      :integer
#  translated_paragraph :text
#  status               :string(255)     default("Open")
#

