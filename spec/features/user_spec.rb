require 'rails_helper'

RSpec.feature "Users", type: :feature do



  describe "Signup new user" do
    context "with valid input" do
      it "logs in user" do
        visit users_new_path
        within("form") do
          fill_in('Email', :with => 'test@test.com')
          fill_in('Password', :with => '1111')
          fill_in('Password Confirmation', :with => '1111')
          end
        click_button 'Submit'
        expect(page).to have_content('Account successfully registered!')
      end
    end
  end






end
