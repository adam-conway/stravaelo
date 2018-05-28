require 'rails_helper'

describe Tournament do
  context 'Field validations' do
    it { should validate_presence_of(:name) }
  end

  describe 'relationships' do
    it { should have_many(:user_tournaments) }
    it { should have_many(:users) }
    it { should have_many(:tournament_segments) }
    it { should have_many(:segments) }
  end
end
