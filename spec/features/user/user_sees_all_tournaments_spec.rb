require "rails_helper"

describe 'User' do
  describe 'visits dashboard' do
    scenario 'sees a link to create a new tournament' do
      user = create(:user)
      allow_any_instance_of(ApplicationController).to receive(:current_user).and_return(user)
      visit dashboard_path

      expect(page).to have_link('Create a New Tournament')

      click_on 'Create a New Tournament'

      expect(current_path).to eq('/tournaments/new')
    end
  end
end
