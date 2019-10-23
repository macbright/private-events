require "rails_helper"

RSpec.describe "Event Management", type: :feature do
  fixtures :events

  before do
    @user = User.create!( name: "Test User",
                          email: "test_user@abc.com" )
    
  end

  it "upcoming event & past evetn show in Events index page" do
    visit '/events'
    expect(page).to have_content 'All Events'
    expect(page).to have_content 'Upcoming Events'
    expect(page).to have_content 'Past Events'
  end

  it 'create event successfully' do
    #log in
    visit '/login'
    expect(page).to have_content("Log In")
    # click_on('Sign in')
    fill_in('Email', with: 'test_user@abc.com')
    click_on('Log in')
    expect(page).to have_content 'You are logged in!'

    click_on('Profile')
    fill_in('event_title', with: 'New Event Here')
    fill_in('event_description', with: 'New Event Create Success')
    fill_in('event_location', with: 'Home')
    fill_in('event[event_date]', with: 15.days.from_now)

    click_on('Publish')

    #check show page
    expect(page).to have_content("Event Saved!")
    expect(page).to have_content("New Event Create Success")

  end

  it 'create event unsuccessfully' do
    #log in
    visit '/login'
    expect(page).to have_content("Log In")
    # click_on('Sign in')
    fill_in('Email', with: 'test_user@abc.com')
    click_on('Log in')
    expect(page).to have_content 'You are logged in!'

    click_on('Profile')
    fill_in('event_title', with: 'New Event Here')
    fill_in('event_description', with: '')
    fill_in('event_location', with: 'Home')
    fill_in('event[event_date]', with: 2.days.from_now)

    click_on('Publish')
    expect(page).to have_content("All field must be filled!")
  end


end