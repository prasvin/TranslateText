require 'spec_helper'

describe Translator do

  it {should have_many :microtasks}

  before(:each) do
    translator = Translator.make(:points => 5)
    translator.save
  end

  context "When a translator is created" do
    it "Should Have type as Translator" do
      User.first.type.should == "Translator"
    end

    it "should have 0 points initially" do
      User.first.points.should == 0
    end
  end

end


# == Schema Information
#
# Table name: users
#
#  id                   :integer         not null, primary key
#  email                :string(255)     default(""), not null
#  encrypted_password   :string(128)     default(""), not null
#  reset_password_token :string(255)
#  remember_created_at  :datetime
#  sign_in_count        :integer         default(0)
#  current_sign_in_at   :datetime
#  last_sign_in_at      :datetime
#  current_sign_in_ip   :string(255)
#  last_sign_in_ip      :string(255)
#  name                 :string(255)
#  points               :float           default(0.0)
#  type                 :string(255)
#  created_at           :datetime
#  updated_at           :datetime
#

