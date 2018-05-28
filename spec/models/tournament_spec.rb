require 'rails_helper'

RSpec.describe Tournament, type: :model do
  describe 'Field validations' do
    it { should validate_presence_of(:name) }
  end

  describe 'relationships' do
    it { should have_many(:user_tournaments) }
    it { should have_many(:users) }
    it { should have_many(:tournament_segments) }
    it { should have_many(:segments) }
  end
end
