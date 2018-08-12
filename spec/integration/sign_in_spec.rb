describe "the signin process", type: :feature do
  before :each do
    User.create(username:'username',email: 'user@example.com', password: 'password')
  end

  it "signs me in" do
    visit '/login'
    within("#session") do
      fill_in 'username', with: 'username'
      fill_in 'password', with: 'password'
    end
    click_button 'Sign in'
    expect(page).to have_content 'Signed in'
  end
end