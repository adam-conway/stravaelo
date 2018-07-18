require "rails_helper"

describe 'Admin' do
  scenario 'adds a new segment to be tracked' do
    VCR.use_cassette("Adding-segment") do
      admin = create(:user, role: 1)
      allow_any_instance_of(ApplicationController).to receive(:current_user).and_return(admin)
      visit segments_path
      expect(current_path).to eq('/segments')

      fill_in 'segment[id]', with: 229781
      click_on "Add Segment"

      expect(current_path).to eq('/segments')
      expect(page).to have_content('Hawk Hill was successfully added')
      expect(Segment.count).to eq(1)

      new_segment = Segment.last

      expect(new_segment.id).to eq(229781)
      expect(new_segment.name).to eq("Hawk Hill")
      expect(new_segment.distance).to eq(2684.82)
      expect(new_segment.average_grade).to eq(5.7)
      expect(new_segment.maximum_grade).to eq(14.2)
      expect(new_segment.elevation_high).to eq(245.3)
      expect(new_segment.elevation_low).to eq(92.4)
      expect(new_segment.total_elevation_gain).to eq(155.733)
      expect(new_segment.athlete_attempts).to eq(338841)
      expect(new_segment.unique_athletes).to eq(33191)
      expect(new_segment.polyline).to eq("}g|eFnpqjVl@En@Md@HbAd@d@^h@Xx@VbARjBDh@OPQf@w@d@k@XKXDFPH\\EbGT`AV`@v@|@NTNb@?XOb@cAxAWLuE@eAFMBoAv@eBt@q@b@}@tAeAt@i@dAC`AFZj@dB?~@[h@MbAVn@b@b@\\d@Eh@Qb@_@d@eB|@c@h@WfBK|AMpA?VF\\\\t@f@t@h@j@|@b@hCb@b@XTd@Bl@GtA?jAL`ALp@Tr@RXd@Rx@Pn@^Zh@Tx@Zf@`@FTCzDy@f@Yx@m@n@Op@VJr@")
    end
  end

  scenario 'Isnt able to add segment if its already in the DB' do
    VCR.use_cassette("Adding-segment") do
      admin = create(:user, role: 1)
      allow_any_instance_of(ApplicationController).to receive(:current_user).and_return(admin)
      visit segments_path
      expect(current_path).to eq('/segments')
      create(:segment, id: 229781)

      fill_in 'segment[id]', with: 229781
      click_on "Add Segment"

      expect(current_path).to eq('/segments')
      expect(page).to have_content('This segment has already been added')
    end
  end
end
