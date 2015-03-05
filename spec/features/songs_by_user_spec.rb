require 'rails_helper'

RSpec.describe "Songs By User" do 
  include Capybara::DSL
  let(:user) do 
    User.create(username: 'Paul', password: 'test')
  end
  let(:user2) do 
    User.create(username: 'Paul', password: 'test')
  end
  let(:song1) do 
    Song.create(artist: 'Weezer', title: 'Crab')
  end
  let(:song2) do 
    Song.create(artist: 'Bob Marley', title: 'No Women No Cry')
  end

  it "will redirect to /login when you visit songs unauthenicated" do
    visit songs_path
    expect(current_path).to eq(login_path)
  end

  it "will allow you to /songs if you are authenticated" do
    ApplicationController.any_instance.stub(:current_user).and_return(user)
    visit songs_path
    expect(current_path).to eq(songs_path)
  end

  it "will show songs belonging to user" do
    user.songs << song1
    ApplicationController.any_instance.stub(:current_user).and_return(user)
    visit songs_path
    expect(page).to have_content(song1.title)
    # expect(page).to_not have_content(song2.title)
  end

  it "will not show songs beloning that don't belong to user" do
    user.songs << song1
    ApplicationController.any_instance.stub(:current_user).and_return(user)
    visit songs_path
    expect(page).to_not have_content(song2.title)
  end

  it "user can create a song to belongs to them" do
    ApplicationController.any_instance.stub(:current_user).and_return(user)
    visit songs_path
    click_link_or_button("New Song")
    expect(current_path).to eq(new_song_path)
    fill_in("song[artist]", with: "Sublime")
    fill_in("song[title]", with: "Wrong Way")
    click_link_or_button('Update Song')
    expect(page).to have_content("Wrong Way")

    click_link_or_button("All Songs")
    expect(current_path).to eq(songs_path)
    # expect(page).to have_content("Sublime")
  end

  it "can't see other Users songs" do
    ApplicationController.any_instance.stub(:current_user).and_return(user)
    user.songs << song1
    user2.songs << song2
    visit songs_path
    expect(page).to_not have_content(song2.title)
  end


end