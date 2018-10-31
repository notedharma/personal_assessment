require 'rails_helper'
require 'spec_helper'


RSpec.describe User, type: :model do
		let(:proper_email)		{ 'name@name.co' }
		# let(:proper_short_url)	{ SecureRandom.base64[0..8] }
		let(:improper_email)	{ 'mmm' }


		describe User, 'validations' do
			it { is_expected.to validate_presence_of(:email) }
			it { is_expected.to validate_presence_of(:password) }
			it { should validate_uniqueness_of(:email) }
			end


			describe "create new user" do

		    context "with invalid input" do
		      it "throws an error when wrong email format" do
		        expect { User.new(email: name.com) }.to raise_error
		      end
		      it "throws an error when wrong password input" do
		        expect { User.new(password: 111) }.to raise_error
		      end
		    end
			end






end
