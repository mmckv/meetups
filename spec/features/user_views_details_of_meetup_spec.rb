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

  scenario "user views details when signed in" do
    visit '/'
    sign_in_as user
    user
    meetup
    userevent1
    userevent
    visit '/'
    click_link 'Launcher Luncher'

    expect(page).to have_content "Chinatown"
    expect(page).to have_content "jabba"
    expect(page).to have_content "Launcher Luncher"
    expect(page).to have_content "jarlax1"
    expect(page).to have_content "Eating lunch with launchers."
  end

  scenario "user views details when signed out" do
    visit '/'
    user
    meetup
    userevent1
    userevent
    visit '/'
    click_link 'Launcher Luncher'

    expect(page).to have_content "Chinatown"
    expect(page).to have_content "jabba"
    expect(page).to have_content "Launcher Luncher"
    expect(page).to have_content "jarlax1"
    expect(page).to have_content "Eating lunch with launchers."
  end
end
