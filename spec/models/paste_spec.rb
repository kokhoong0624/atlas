require 'rails_helper'
require 'byebug'

RSpec.describe Paste, :type => :model do 
	it "is valid with valid attributes" do
		paste = Paste.new(title:'Test title',content:'Test content')
		expect(paste).to be_valid
	end


  	it "test for dependent destroy" do
  		user = User.create(username: 'kok', password:'abcd', email:'abcd@live.com')
  		Paste.create(title:"test", content:"test", user:user)
  		Paste.create(title:"test2", content:"test2", user:user)
		expect { user.destroy }.to change { Paste.count }.by(-2)
  	end

  	it "should belongs to one user" do
	    t = Paste.reflect_on_association(:user)
	    expect(t.macro).to eq(:belongs_to)
  	end

    it "should rename untitled pastes titles with untitled" do 
      paste = Paste.new(content:'Test content')
      expect(paste.title).to eq("untitled")
    end

  	it "return search results for pastes" do
    	paste = Paste.create(title:"test1", content:"searchresults") 
    	@result = Paste.search(search: "test1")
    	expect(@result).to eq([paste])
    end

    it "return search results for pastes" do
    	@result = Paste.search(search: "test1")
    	expect(@result).to eq([])
  	end

end