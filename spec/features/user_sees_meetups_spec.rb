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
    name: "Launcher Luncher",
    location: "Chinatown",
    user_id: 1,
    description: "Eating lunch with launchers."
    )
  end

  scenario "list of meetups show when signed in" do
    visit '/'
    meetup
    sign_in_as user
    visit '/'

    expect(page).to have_content "Launcher Luncher"
  end

  scenario "list of meetups show when not signed in" do
    visit '/'
    meetup
    sign_in_as user
    click_link "Sign Out"
    visit '/'

    expect(page).to have_content "Launcher Luncher"
  end
end
