require 'rails_helper'

RSpec.describe TournamentSegment, type: :model do
  describe 'Field validations' do
  end

  describe 'relationships' do
    it { should belong_to(:segment) }
    it { should belong_to(:tournament) }
  end
end
