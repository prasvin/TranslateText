require 'spec_helper'

describe Task do

  it { should validate_presence_of :title }
  it { should validate_presence_of :deadline }
  it { should validate_presence_of :text }
  it { should validate_presence_of :language_from }
  it { should validate_presence_of :language_to }
  it { should validate_presence_of :requester }

  it { should have_many(:microtasks).dependent(:destroy) }
  it { should belong_to :requester }

  context "When a task is created" do

    it "Should not allow negative points" do
      task = Task.make(:points => -1)
      task.save

      task.errors[:points].first.should == "must be greater than or equal to 0"
    end

    it "Should have points lesser than its requester's" do
      task = Task.make(:points => 100)
      task.requester.update_attributes({:points => 10})
      task.save

      task.errors[:points].first.should == "Not Enough Points"
    end

    it "Should create its corresponding microtasks" do
      text = "aaaaaaa\r\n\r\nbbbbbb\r\ncccccccc\r\n\r\nddddddd"
      task = Task.make(:text => text)
      task.save

      Task.first.microtasks.length.should > 0
    end
  end
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
#  points        :float
#  created_at    :datetime
#  updated_at    :datetime
#

