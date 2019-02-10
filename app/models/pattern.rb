class Pattern < ApplicationRecord
  has_many :favorites
  belongs_to :pattern_group
  belongs_to :category
end
