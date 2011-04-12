class Task < ActiveRecord::Base
  has_many :microtasks
  belongs_to :requester

  validates :title, :presence => true
  validates :text, :presence => true
  validates :deadline, :presence => true
  validates :requester, :presence => true
  validates :language_from, :presence => true
  validates :language_to, :presence => true

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

