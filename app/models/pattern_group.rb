class PatternGroup < ApplicationRecord
  has_many :patterns
  belongs_to :category
end
