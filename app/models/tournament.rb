class Tournament < ApplicationRecord
  validates :name, presence: true

  has_many :user_tournaments
  has_many :users, through: :user_tournaments

  has_many :tournament_segments
  has_many :segments, through: :tournament_segments
end
