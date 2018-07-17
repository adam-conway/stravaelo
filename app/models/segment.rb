class Segment < ApplicationRecord
  has_many :tournament_segments
  has_many :tournaments, through: :tournament_segments

  has_many :user_segments
  has_many :users, through: :user_segments

  validates :name, presence: true
  validates :distance, presence: true
  validates :average_grade, presence: true
  validates :maximum_grade, presence: true
  validates :elevation_high, presence: true
  validates :elevation_low, presence: true
  validates :total_elevation_gain, presence: true
  validates :athlete_attempts, presence: true
  validates :unique_athletes, presence: true
  validates :polyline, presence: true

  def self.alphabetical
    order(:name)
  end

  def self.excluded_segments(included_segments)
    where.not(id: included_segments.pluck(:id))
         .alphabetical
  end

  def self.kom_times
    pluck(:kom_time).map do |kom_time|
      Time.at(kom_time).utc.strftime("%H:%M:%S")
    end
  end

  def pr_and_scores(tournament)
    user_segments.where(user_id: tournament.users.pluck(:id))
                 .includes(user: [:user_tournaments])
                 .where("user_tournaments.tournament_id = #{tournament.id}")
                 .order('user_tournaments.total_perf_perc DESC')
  end
end
