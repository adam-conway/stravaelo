require 'rails_helper'

RSpec.describe Segment, type: :model do
  describe 'Field validations' do
  end

  describe 'relationships' do
    it { should have_many(:user_segments) }
    it { should have_many(:users) }
    it { should have_many(:tournament_segments) }
    it { should have_many(:tournaments) }
  end
end
