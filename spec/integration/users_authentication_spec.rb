require "rails_helper"

RSpec.describe "User Authentication", type: :feature do
  before :each do
    User.create(name: "Example User", email: 'user@example.com')
  end

  it "sucessful login" do
    visit '/login'
    fill_in('Email', with: 'user@example.com')
    click_on('Log in')
    expect(page).to have_content 'You are logged in!'
  end

  it "unsucessful login" do
    visit '/login'
    fill_in('Email', with: 'wrong@example.com')
    click_on('Log in')
    expect(page).to have_content 'This user is not register!!'
  end


  it "sucessful logout" do
    visit '/login'
    fill_in('Email', with: 'user@example.com')
    click_on('Log in')

    click_on('Sign Out')
    expect(page).to have_content 'You have just signed out!'
  end

end