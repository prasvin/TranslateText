require 'spec_helper'

describe Requester do

  it { should have_many :tasks}

  context "When a requester is created" do
    it "Should Have type as requester" do
      requester = Requester.make
      requester.save
      User.first.type.should == "Requester"
    end
  end
end
