class Job < ApplicationRecord
  validates :title, presence: true
  validates :age_lower_limit, presence: true
  validates :age_upper_limit, presence: true
  validates :age_lower_limit, numericality: {greater_than:18}
  validates :age_upper_limit, numericality: {less_than:100}
def publish!
  self.is_hidden =false
  self.save
end

def hide!
  self.is_hidden =true
  self.save
end
scope :published, ->{ where(is_hidden: false)}
scope :recent, -> {order('created_at DESC')}
end
