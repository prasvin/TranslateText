class Microtask < ActiveRecord::Base
  belongs_to :task
  belongs_to :translator
  has_many :log_entries, :dependent => :destroy

  validates :paragraph, :presence => true
  validates :paragraph_index, :presence => true
  validates :points, :presence => true
  validates :task, :presence => true

  after_create :log_entry

  scope :with_language_to, lambda {|language_id| self.joins(:task) & Task.with_language_to(language_id) }
  scope :with_language_from, lambda {|language_id| self.joins(:task) & Task.with_language_from(language_id) }
  scope :pays_more_than, lambda {|p| where("microtasks.points >= ?", p) }
  scope :open, where('status = ?', "Open")
  scope :accepted, where('status = ?', "Accepted")

  scope :with_user, lambda {|user_id| self.joins(:task) & Task.where(:requester_id == user_id) }
  scope :with_log_entry, lambda {|id| self.joins(:log_entries) & LogEntry.where(:microtask_id == id) }

  def name
    "#{self.task.title}[#{self.paragraph_index}]"
  end

  def clear_status
    if self.status == "Processing"
      self.status = "Open"
      self.translator = nil
      self.save
    end
  end

  private

  def log_entry
    self.log_entries.create({:message => "Created", :user_id => self.task.requester.id})
  end

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

