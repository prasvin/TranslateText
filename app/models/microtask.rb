class Microtask < ActiveRecord::Base
  belongs_to :task
  belongs_to :translator

  validates :paragraph, :presence => true
  validates :paragraph_index, :presence => true
  validates :points, :presence => true
  validates :task, :presence => true

  scope :with_language_to, lambda {|language_id| self.joins(:task) & Task.with_language_to(language_id) }
  scope :with_language_from, lambda {|language_id| self.joins(:task) & Task.with_language_from(language_id) }
  scope :pays_more_than, lambda {|p| where("points >= ?", p) }
end



# == Schema Information
#
# Table name: microtasks
#
#  id              :integer         not null, primary key
#  task_id         :integer
#  translator_id   :integer
#  points          :float
#  paragraph       :text
#  created_at      :datetime
#  updated_at      :datetime
#  paragraph_index :integer
#

