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

  let(:user2) do
    User.create(
      provider: "github",
      uid: "11",
      username: "jabba",
      email: "ddx1@launcademy.com",
      avatar_url: "https://avatars2.githubusercontent.com/u/174825?v=3&s=400"
    )
  end

  let(:userevent) do
    UsersEvent.create(
      event: meetup,
      user: user
    )
  end

  let(:userevent1) do
    UsersEvent.create(
      event: meetup,
      user: user2
    )
  end

  let(:meetup) do
    Event.create(
    name: "Launcher Luncher",
    location: "Chinatown",
    user: user,
    description: "Eating lunch with launchers."
    )
  end

  scenario "when signed in, user joins event after clicking join button" do
    visit '/'
    sign_in_as user2
    user2
    meetup
    visit '/'
    click_link 'Launcher Luncher'
    click_button 'Join Meetup'

    expect(page).to have_content "jabba"

  end

  scenario "when signed out, user is prompted to sign in after clicking join button" do
    visit '/'
    meetup
    visit '/'
    click_link 'Launcher Luncher'
    click_button 'Join Meetup'

    expect(page).to have_content "You must be signed in to join meetup!"
  end

  scenario "when already in meetup, user is prompted so when signed in" do
    visit '/'
    sign_in_as user2
    user2
    meetup
    userevent1
    visit '/'
    click_link 'Launcher Luncher'
    click_button 'Join Meetup'

    expect(page).to have_content "You are already included in the meetup!"
  end
end
