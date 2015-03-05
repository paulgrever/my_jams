require 'test_helper'

class SongCreationTest < ActionDispatch::IntegrationTest
  include Capybara::DSL

  test "user can create a song" do
    visit new_song_path
    fill_in('Artist', :with => 'Weezer')
    fill_in('Title', :with => 'Crab')
    click_link_or_button("Create Song")
    assert page.has_content?("Weezer")
  end

  test "user can not create a song without a title" do 
    visit new_song_path
    fill_in('Artist', :with => 'Weezer')
    click_link_or_button("Create Song")
    assert page.has_content?("Please enter a title")


  end
end