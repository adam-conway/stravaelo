require 'rails_helper'

RSpec.describe User, type: :model do
  describe 'Field validations' do
    it { should validate_presence_of(:email) }
  end

  describe 'relationships' do
    it { should have_many(:user_tournaments) }
    it { should have_many(:tournaments) }
    it { should have_many(:user_segments) }
    it { should have_many(:segments) }
  end

  describe 'Queries' do
    it 'Returns a single users total score for a tournament' do
      user = create(:user)
      user_tournament1 = create(:user_tournament, user_id: user.id, total_perf_perc: 11.33222)
      user_tournament2 = create(:user_tournament, user_id: user.id, total_perf_perc: 50.00444)

      expect(user.total_tournament_score(user_tournament1.tournament)).to eq(11.33)
      expect(user.total_tournament_score(user_tournament2.tournament)).to eq(50.00)
    end
  end
end
