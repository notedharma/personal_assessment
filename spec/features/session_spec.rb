require 'rails_helper'

RSpec.feature "Sessions", type: :feature do
  describe "login" do
    it "rejects incomplete input" do
      visit login_path
      within("form") do
        fill_in('Email', with: 'test@test.com')

      end
      click_button 'Log In'
      expect(page).to have_content('Invalid')
    end
  end
end
