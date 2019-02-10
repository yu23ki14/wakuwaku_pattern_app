class Category < ApplicationRecord
  has_many :patterns
  has_many :pattern_groups
end
