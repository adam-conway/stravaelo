require 'rails_helper'

RSpec.describe UserSegment, type: :model do
  describe 'Field validations' do
  end

  describe 'relationships' do
    it { should belong_to(:user) }
    it { should belong_to(:segment) }
  end
end
