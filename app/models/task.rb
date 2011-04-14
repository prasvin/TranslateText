class Task < ActiveRecord::Base
  has_many :microtasks, :dependent => :destroy
  belongs_to :requester

  validates :title, :presence => true
  validates :text, :presence => true
  validates :deadline, :presence => true
  validates :requester, :presence => true
  validates :language_from, :presence => true
  validates :language_to, :presence => true
  validates :points, :numericality => { :greater_than => 0}

  after_initialize :date_today
  after_create :build_microtasks
  before_save :validate_points

  scope :with_language_to, lambda{ |language_id| where(:language_to => language_id) }
  scope :with_language_from, lambda{ |language_id| where(:language_from => language_id) }

  after_validation(:on => :create) do
      if self.points
        if self.requester.points < self.points
          return false;
        end
      end
  end

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

  def validate_points
    if self.points
      if self.points > self.requester.points
        self.errors.add(:points, "Not Enough Points")
        return false
      end
    end
    return true
  end

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

