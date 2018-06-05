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
end
