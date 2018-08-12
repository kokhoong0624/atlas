describe "the welcome page", type: :feature do
  # before :each do
  #   User.create(username:'username',email: 'user@example.com', password: 'password', admin:true)
  # end

  it "can visit the velcome page" do
    visit '/'

    expect(page).to have_content 'Welcome'
  end
end

