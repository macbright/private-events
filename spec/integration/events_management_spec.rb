require "rails_helper"

RSpec.describe "Event Management", type: :feature do

  it "Display All Events" do
    visit '/events'
    expect(page).to have_content 'All Events'
  end
  

end