class Tournament < ApplicationRecord
  validates :name, presence: true
end
