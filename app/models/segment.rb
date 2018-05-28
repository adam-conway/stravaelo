class Segment < ApplicationRecord
  has_many :tournament_segments
  has_many :tournaments, through: :tournament_segments
end
