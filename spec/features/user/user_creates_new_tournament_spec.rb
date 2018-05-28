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
  describe 'visits new tournament page' do
    scenario 'and fills out form' do
      user = create(:user)
      segment_list = create_list(:segment, 10)
      allow_any_instance_of(ApplicationController).to receive(:current_user).and_return(user)
      visit new_tournament_path

      fill_in 'tournament[email]', with: "adam.n.conway@gmail.com"
      select("#{segment_list[0].name}", :from => 'Select Box')
    end
  end
end
