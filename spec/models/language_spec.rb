require 'spec_helper'

describe Language do

  it { should validate_presence_of :name }

  it "Should have a unique name" do
    language1 = Language.make(:name => "Nepali")
    language1.save
    language2 = Language.make(:name => "Nepali")
    language2.save

    language2.errors[:name].length.should > 0
  end
end

# == Schema Information
#
# Table name: languages
#
#  id         :integer         not null, primary key
#  name       :string(255)
#  created_at :datetime
#  updated_at :datetime
#

