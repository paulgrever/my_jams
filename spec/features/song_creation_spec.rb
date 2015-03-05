require 'rails_helper'

RSpec.describe "User creates a song" do
  let(:user) do 
    User.create(username: 'Paul', password: 'test')
  end
  context "with valid attributes" do
    it "saves and displays the song title" do
      ApplicationController.any_instance.stub(:current_user).and_return(user)
      visit new_song_path
      fill_in('Artist', :with => 'Weezer')
      fill_in('Title', :with => 'Crab')
      click_link_or_button("Update Song")
      expect(page).to have_content('Crab')
    end
  end
end
