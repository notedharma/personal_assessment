require 'rails_helper'
require 'spec_helper'


RSpec.describe User, type: :model do
		let(:proper_email)		{ 'name@name.co' }
		# let(:proper_short_url)	{ SecureRandom.base64[0..8] }
		let(:improper_email)	{ 'x' }


		# context "validation: " do
		#
		# 	it "takes valid email format" do
		# 		expect{ User.new(email: proper_email) }.not_to raise_error
		# 	end
		#
		# 	it "it does not take wrong email format" do
		# 		expect{ User.new(email: improper_email) }.not_to raise_error
		# 	end

		describe User, 'validations' do
			it { is_expected.to validate_presence_of(:email) }
			it { is_expected.to validate_presence_of(:password) }
			it { should validate_uniqueness_of(:email) }
			end


			describe "#initialize" do

		    context "with invalid input" do
		      it "throws an argument error when not given a acct_number argument" do
		        expect { User.new }.to raise_error(ArgumentError)
		      end
		      it "throws an argument error when wrong password input type" do
		        expect { User.new(password: 111) }.to raise_error
		      end
		    end
		  # end

			# it { is_expected.to validate_presence_of(:long_url) }
			# it { is_expected.to allow_value(proper_long_url).for(:long_url) }
			# it { is_expected.not_to allow_value(improper_long_url).for(:long_url)  }
			# it { is_expected.to validate_presence_of(:short_url) }
		# end
		#
		# context "creates: " do
		# 	it "takes in one valid long_url" do
		# 		expect{ Url.create(long_url: proper_long_url) }.not_to raise_error
			end




end
