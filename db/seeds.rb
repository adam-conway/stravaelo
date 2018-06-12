# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.fir


UserTournament.destroy_all
TournamentSegment.destroy_all
UserSegment.destroy_all
User.destroy_all
Tournament.destroy_all
Segment.destroy_all

tournament = Tournament.create!(name: "Bay Area Icons", created_at: "2018-06-11 01:04:46", updated_at: "2018-06-11 01:04:46")

segment1 = Segment.create!(id: 1470688, name: "Northgate to Summit from Castle Rock", distance: 19862.9, average_grade: 5.4, maximum_grade: 17.0, elevation_high: 1120.0, elevation_low: 38.4, total_elevation_gain: 1090.6, athlete_attempts: 17904, unique_athletes: 6303, created_at: "2018-06-03 16:24:39", updated_at: "2018-06-06 03:18:24", kom_time: 3156)
segment2 = Segment.create!(id: 5816161, name: "Tunnel Road", distance: 4965.8, average_grade: 4.7, maximum_grade: 10.8, elevation_high: 435.1, elevation_low: 202.0, total_elevation_gain: 0.0, athlete_attempts: 251095, unique_athletes: 12294, created_at: "2018-06-03 16:24:48", updated_at: "2018-06-06 03:18:24", kom_time: 613)
segment3 = Segment.create!(id: 316833, name: "Pinehurst from Canyon Rd.", distance: 6343.44, average_grade: 3.4, maximum_grade: 75.0, elevation_high: 367.6, elevation_low: 151.4, total_elevation_gain: 0.0, athlete_attempts: 122818, unique_athletes: 12062, created_at: "2018-06-03 16:25:22", updated_at: "2018-06-06 03:18:25", kom_time: 777)
segment4 = Segment.create!(id: 618015, name: "El Toyonal/Lomas Contadas", distance: 4705.68, average_grade: 8.0, maximum_grade: 36.2, elevation_high: 502.7, elevation_low: 124.1, total_elevation_gain: 394.899, athlete_attempts: 3133, unique_athletes: 843, created_at: "2018-06-03 23:06:12", updated_at: "2018-06-06 03:22:09", kom_time: 895)
segment5 = Segment.create!(id: 749803, name: "South Park Drive Gate to Gate", distance: 2261.84, average_grade: 9.0, maximum_grade: 18.3, elevation_high: 471.6, elevation_low: 268.8, total_elevation_gain: 202.8, athlete_attempts: 21577, unique_athletes: 3891, created_at: "2018-06-03 23:06:18", updated_at: "2018-06-06 03:22:09", kom_time: 434)
segment6 = Segment.create!(id: 2685055, name: "Wildcat Canyon SPDR to Spruce", distance: 9408.58, average_grade: 1.2, maximum_grade: 12.3, elevation_high: 272.8, elevation_low: 95.0, total_elevation_gain: 191.4, athlete_attempts: 60612, unique_athletes: 7334, created_at: "2018-06-03 23:06:24", updated_at: "2018-06-06 03:22:10", kom_time: 992)
segment7 = Segment.create!(id: 4648538, name: "The Three Bears - Bottom of Mama to Top of Baby", distance: 10818.7, average_grade: -0.3, maximum_grade: 11.9, elevation_high: 288.2, elevation_low: 104.4, total_elevation_gain: 264.4, athlete_attempts: 48026, unique_athletes: 9974, created_at: "2018-06-03 23:06:30", updated_at: "2018-06-06 03:22:10", kom_time: 993)

Segment.all.each do |segment|
  tournament.tournament_segments.create!(segment_id: segment.id)
end

user1 = User.create!(email: "adam.n.conway@gmail.com", uid: "8722083", token: "489ed4cead0b0624997d0c026200a6912e8662b5", role: "admin", created_at: "2018-06-03 16:23:12", updated_at: "2018-06-03 16:24:08", name: "Adam Conway", status: "active")
segment1.user_segments.create!(user_id: user1.id, pr: 8218, perf_perc: segment1.kom_time / 8218.to_f)
segment2.user_segments.create!(user_id: user1.id, pr: 1135, perf_perc: segment2.kom_time / 1135.to_f)
segment3.user_segments.create!(user_id: user1.id, pr: 1298, perf_perc: segment3.kom_time / 1298.to_f)
segment4.user_segments.create!(user_id: user1.id, pr: 0, perf_perc: 0)
segment5.user_segments.create!(user_id: user1.id, pr: 792, perf_perc: segment5.kom_time / 792.to_f)
segment6.user_segments.create!(user_id: user1.id, pr: 0, perf_perc: 0)
segment7.user_segments.create!(user_id: user1.id, pr: 1958, perf_perc: segment7.kom_time / 1958.to_f)
tournament.user_tournaments.create!(user_id: user1.id, total_perf_perc: user1.user_segments.pluck(:perf_perc).sum)

user2 = User.create!(email: "bryan.bischof@gmail.com", uid: "26065", token: "7f83da4886e87219d18a55a7d122fdb56c6af308", role: "admin", created_at: "2018-06-03 20:22:00", updated_at: "2018-06-03 21:10:06", name: "Bryan Bischof", status: "active")
segment1.user_segments.create!(user_id: user2.id, pr: 0, perf_perc: 0)
segment2.user_segments.create!(user_id: user2.id, pr: 1078, perf_perc: segment2.kom_time / 1078.to_f)
segment3.user_segments.create!(user_id: user2.id, pr: 1211, perf_perc: segment3.kom_time / 1211.to_f)
segment4.user_segments.create!(user_id: user2.id, pr: 1655, perf_perc: segment4.kom_time / 1655.to_f)
segment5.user_segments.create!(user_id: user2.id, pr: 721, perf_perc: segment5.kom_time / 721.to_f)
segment6.user_segments.create!(user_id: user2.id, pr: 0, perf_perc: 0)
segment7.user_segments.create!(user_id: user2.id, pr: 0, perf_perc: 0)
tournament.user_tournaments.create!(user_id: user2.id, total_perf_perc: user2.user_segments.pluck(:perf_perc).sum)

user3 = User.create!(email: "ryan.f.schafer@gmail.com", uid: "12303297", token: "594408967689a0380127baafe7c56f2614faaece", role: "default", created_at: "2018-06-03 22:03:43", updated_at: "2018-06-03 22:44:39", name: "Ryan Schafer", status: "active")
segment1.user_segments.create!(user_id: user3.id, pr: 10020, perf_perc: segment1.kom_time / 10020.to_f)
segment2.user_segments.create!(user_id: user3.id, pr: 1655, perf_perc: segment2.kom_time / 1655.to_f)
segment3.user_segments.create!(user_id: user3.id, pr: 1879, perf_perc: segment3.kom_time / 1879.to_f)
segment4.user_segments.create!(user_id: user3.id, pr: 2381, perf_perc: segment4.kom_time / 2381.to_f)
segment5.user_segments.create!(user_id: user3.id, pr: 1400, perf_perc: segment5.kom_time / 1400.to_f)
segment6.user_segments.create!(user_id: user3.id, pr: 2299, perf_perc: segment6.kom_time / 2299.to_f)
segment7.user_segments.create!(user_id: user3.id, pr: 2466, perf_perc: segment7.kom_time / 2466.to_f)
tournament.user_tournaments.create!(user_id: user3.id, total_perf_perc: user3.user_segments.pluck(:perf_perc).sum)

# user4 = User.create!(email: "lgoerl@gmail.com", uid: "996434", token: "e037789ef8a8db87de9f8a8cea6e069af980121b", role: "default", created_at: "2018-06-04 17:48:50", updated_at: "2018-06-04 17:51:27", name: "lee goerl", status: "active")
# user5 = User.create!(email: "ktransier@gmail.com", uid: "1516573", token: "a80987cf30f34fa3d0f62315a9cc906eaf410e76", role: "default", created_at: "2018-06-04 20:20:36", updated_at: "2018-06-04 20:20:36", name: "Kenneth Transier", status: "active")
# user6 = User.create!(email: "david.lachasse@gmail.com", uid: "21136550", token: "92418d704c20da9d2bafdebb1a8d146f3c7238cb", role: "default", created_at: "2018-06-04 22:24:33", updated_at: "2018-06-04 22:27:19", name: "Dave La Chasse", status: "active")
# user7 = User.create!(email: "scottrocher@gmail.com", uid: "15342", token: "7a8b77ea1c232a07da2c92310ad0658e662179db", role: "default", created_at: "2018-06-04 22:32:33", updated_at: "2018-06-04 23:06:54", name: "Scott Rocher", status: "active")
# user8 = User.create!(email: "ndirienzo@gmail.com", uid: "4840268", token: "03bf639fc6312456ba3c46ad3e77b0076814b317", role: "default", created_at: "2018-06-07 04:33:02", updated_at: "2018-06-07 14:38:59", name: "Nick DiRienzo", status: "active")
# user9 = User.create!(email: "iankendrick@gmail.com", uid: "3489371", token: "d89d6dd3ab96d6ca4c3d4da21a5d67281ca1a725", role: "default", created_at: "2018-06-07 20:37:00", updated_at: "2018-06-07 20:39:41", name: "Ian Kendrick", status: "active")
# user10 = User.create!(email: "hoyhoy@gmail.com", uid: "283349", token: "678fe0f4456f5f48eaec43565ed8097d75404ee0", role: "default", created_at: "2018-06-12 05:23:22", updated_at: "2018-06-12 05:26:34", name: "Tony Perrie", status: "active")
