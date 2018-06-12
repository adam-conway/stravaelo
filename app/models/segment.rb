class Segment < ApplicationRecord
  has_many :tournament_segments
  has_many :tournaments, through: :tournament_segments

  has_many :user_segments
  has_many :users, through: :user_segments
end
