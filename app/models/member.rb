class Member < ApplicationRecord
  has_many :users, dependent: :destroy
end
