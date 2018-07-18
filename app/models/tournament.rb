class Tournament < ApplicationRecord
  validates :name, presence: true

  has_many :user_tournaments
  has_many :users, through: :user_tournaments

  has_many :tournament_segments
  has_many :segments, through: :tournament_segments

  def active_users
    users.where(status: "active")
  end

  def pending_users
    users.where(status: "pending")
  end

  def total_user_scores
    user_tournaments.order(total_perf_perc: :desc).pluck(:total_perf_perc)
  end

  def polylines
    segments.pluck(:polyline)
  end
end
