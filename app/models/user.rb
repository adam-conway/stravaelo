class User < ApplicationRecord
  validates :email, presence: true
  enum role: [ "default", "admin" ]
  enum status: [ "active", "pending" ]

  def self.from_omniauth(auth_info)
    if User.find_by(email: auth_info[:info][:email])
      user = User.find_by(email: auth_info[:info][:email])
      user.update(uid: auth_info[:extra][:raw_info][:id],
                  token: auth_info[:credentials][:token],
                  name: auth_info[:extra][:raw_info][:firstname] + " " + auth_info[:extra][:raw_info][:lastname],
                  email: auth_info[:info][:email],
                  status: 'active')
      return user
    else
      where(uid: auth_info[:uid]).first_or_create do |new_user|
        new_user.uid                = auth_info.uid
        new_user.email              = auth_info.info.email
        new_user.token              = auth_info.credentials.token
        new_user.name               = auth_info.extra.raw_info.firstname + " " + auth_info.extra.raw_info.lastname
      end
    end
  end

  has_many :user_tournaments
  has_many :tournaments, through: :user_tournaments

  has_many :user_segments
  has_many :segments, through: :user_segments

  def total_tournament_score(tournament)
    user_tournaments.find_by(tournament_id: tournament.id, user_id: self.id)
                    .total_perf_perc
                    &.round(2)
  end

  def self.tournament_ranked(tournament)
    includes(:user_tournaments)
      .where("user_tournaments.tournament_id = #{tournament.id}")
      .order('user_tournaments.total_perf_perc DESC')
  end

  def pr_and_scores(tournament)
    user_segments.where(segment_id: tournament.segments.pluck(:id))
                 .includes(:segment)
                 .order("segments.name")
  end

end
