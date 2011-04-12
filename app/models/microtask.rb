class Microtask < ActiveRecord::Base
  belongs_to :task
  belongs_to :translator
  validates :paragraph, :presence => true
  validates :points, :presence => true
  validates :task, :presence => true
end

# == Schema Information
#
# Table name: microtasks
#
#  id            :integer         not null, primary key
#  task_id       :integer
#  translator_id :integer
#  point         :float
#  paragraph     :text
#  deadline      :datetime
#  created_at    :datetime
#  updated_at    :datetime
#

