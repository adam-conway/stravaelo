class Segment < ApplicationRecord
  has_many :tournament_segments
  has_many :tournaments, through: :tournament_segments

  has_many :user_segments
  has_many :users, through: :user_segments

  def self.alphabetical
    order(:name)
  end

  def self.excluded_segments(included_segments)
    where.not(id: included_segments.pluck(:id))
         .alphabetical
  end
end
