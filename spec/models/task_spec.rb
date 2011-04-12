require 'spec_helper'

describe Task do

  it { should validate_presence_of :title }
  it { should validate_presence_of :deadline }
  it { should validate_presence_of :text }
  it { should validate_presence_of :language_from }
  it { should validate_presence_of :language_to }
  it { should validate_presence_of :requester }

  it { should have_many :microtasks }
  it { should belong_to :requester }
end

# == Schema Information
#
# Table name: tasks
#
#  id            :integer         not null, primary key
#  title         :string(255)
#  text          :text
#  deadline      :datetime
#  requester_id  :integer
#  language_from :integer
#  language_to   :integer
#  completed     :float
#  points        :float
#  created_at    :datetime
#  updated_at    :datetime
#

