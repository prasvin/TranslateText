class Language < ActiveRecord::Base

  validates :name, :presence => true, :uniqueness => true

  default_scope order("name ASC")

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

