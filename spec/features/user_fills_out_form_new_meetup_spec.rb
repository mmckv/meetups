require 'spec_helper'

feature "User signs in" do
  let(:user) do
    User.create(
      provider: "github",
      uid: "1",
      username: "jarlax1",
      email: "jarlax1@launchacademy.com",
      avatar_url: "https://avatars2.githubusercontent.com/u/174825?v=3&s=400"
    )
  end

  let(:meetup) do
    Event.create(
    name: "Friday Fun Time",
    location: "Launch HQ",
    description: "Turnip time.",
    user: user
    )
  end

  scenario "form for new meetup shows when signed in with required fields" do
    visit '/meetups/new'
    meetup
    sign_in_as user
    visit '/meetups/new'

    expect(page).to have_content "Name:"
    expect(page).to have_content "Location:"
    expect(page).to have_content "Description:"
  end

  scenario "successfully submits form when signed in and filled out" do
    visit '/'
    sign_in_as user
    visit '/meetups/new'
    fill_in 'Name', with: "Pizza Party!"
    fill_in 'Location', with: "My House"
    fill_in 'Description', with: "Pizzzzzas"
    click_button "Submit"

    expect(page).to have_content "Pizza Party!"
  end

  scenario "does not submit form when missing fields when signed in" do
    visit '/'
    sign_in_as user
    visit '/meetups/new'
    fill_in 'Name', with: ""
    fill_in 'Location', with: "My House"
    fill_in 'Description', with: "Pizzzzzas"
    click_button "Submit"

    expect(page).to have_content "Add a New Meetup!"
  end
end
