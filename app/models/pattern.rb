class Pattern < ApplicationRecord
  has_many :favorites
  has_many :tiny_patterns
  has_many :quotes
  belongs_to :pattern_group
  belongs_to :category
end
