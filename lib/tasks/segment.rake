namespace :segment do
  desc "Adds polyline to each segment"
  task add_polyline: :environment do
    Segment.connection
    Segment.all.each do |segment|
      if segment.polyline.nil?
        query = Faraday.get "https://www.strava.com/api/v3/segments/#{segment.id}?access_token=#{ENV['strava_my_token']}"
        data = JSON.parse(query.body, symbolize_names: true)
        polyline = data[:map][:polyline]
        segment.update(polyline: polyline)
      end
    end
  end
end
