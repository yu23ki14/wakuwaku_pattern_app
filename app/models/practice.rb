class Practice < ApplicationRecord
  belongs_to :user
  belongs_to :pattern
  belongs_to :language
  belongs_to :project_practice
  has_many :practice_comments
  
  before_create do
    self.enddate = Time.now + limit*86400
    self.lastdate = Time.now - 43200
  end
end
