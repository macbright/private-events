require "rails_helper"

describe "the signin process", type: :feature do
  before :each do
    User.create(name: "bright", email: 'user@example.com')
  end

  it "signs me in" do
    visit '/login'
      fill_in 'Email', with: 'user@example.com'
    click_button 'commit'
    expect(page).to have_content 'You are logged in!'
  end

  it "displays events" do
    visit '/events'
    expect(page).to have_content 'All Events'
  end

  it "displays events" do
    visit '/login'
      fill_in 'Email', with: 'user@example.com'
    click_button 'commit'
    
    click_link 'Sign Out'
    expect(page).to have_content 'You have just signed out!'
  end
end