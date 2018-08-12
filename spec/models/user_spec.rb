require 'rails_helper'
require 'byebug'

RSpec.describe User, :type => :model do 
	it "is valid with valid attributes" do
		user = User.new(username: 'kok', password:'abcd', email:'abcd@live.com')
		expect(user).to be_valid
	end

	it "is not valid with repeated username" do
		user1 = User.create(username: 'kok', password:'abcd', email:'abcd@live.com')
		user2 = User.new(username: 'kok', password:'abcd', email:'abc@live.com')
		expect(user2).to_not be_valid
	end

	it "is not valid without a username" do
		user = User.new(password:'abcd', email:'abcd@live.com')
		expect(user).to_not be_valid
	end

	it "is not valid without a password" do
		user = User.new(username:'kok', email:'abc@email.com')
		expect(user).to_not be_valid
	end

	it "is not valid without an email" do
		user = User.new(username:'kok', password:'abcd')
		expect(user).to_not be_valid
	end


	it "should have many pastes" do
	    t = User.reflect_on_association(:pastes)
	    expect(t.macro).to eq(:has_many)
  	end


end