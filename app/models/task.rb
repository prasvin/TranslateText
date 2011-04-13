class Task < ActiveRecord::Base
  has_many :microtasks
  belongs_to :requester

  validates :title, :presence => true
  validates :text, :presence => true
  validates :deadline, :presence => true
  validates :requester, :presence => true
  validates :language_from, :presence => true
  validates :language_to, :presence => true

  after_initialize :date_today

  def get_language_from
    Language.find(self.language_from)
  end

  def get_language_to
    Language.find(self.language_to)
  end

  def split_text
    self.text.split("\n\n").delete_if{ |x| x.length == 0 }
  end

  def build_microtasks
    microtask_texts = self.text.split("\r\n\r\n").map{|x| x.strip }
    microtask_texts.delete_if{ |x| x.length == 0 }
           (0..microtask_texts.length-1).each do |index|
             self.microtasks.build( :paragraph => microtask_texts[index],
                                                      :paragraph_index => index,
                                                      :points => microtask_texts[index].length * self.points / self.text.length
                                                   ).save
           end
  end

  private

  def date_today
    self.deadline = DateTime.now
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
#  completed     :float           default(0.0)
#  points        :float
#  created_at    :datetime
#  updated_at    :datetime
#

