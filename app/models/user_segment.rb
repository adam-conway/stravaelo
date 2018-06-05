class UserSegment < ApplicationRecord
  belongs_to :user
  belongs_to :segment
end
