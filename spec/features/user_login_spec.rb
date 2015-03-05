require 'rails_helper'

RSpec.describe "Registered User" do 
  include Capybara::DSL

  it "cannot login without username and password" do
    User.create(username: 'Paul', password: 'test')
    visit login_path
    fill_in('session[username]', with: 'Paul')
    fill_in('session[password]', with: 'test')
    click_link_or_button("Sign in")
    expect(page).to  have_content("Welcome Paul")
  end

  it "cannot login with invalid credentials" do
    User.create(username: 'Paul', password: 'test')
    visit login_path
    fill_in('session[username]', with: 'Paul')
    fill_in('session[password]', with: 'fake')
    click_link_or_button("Sign in")
    expect(page).to  have_content("Invalid Login")
  end

  it 'can logout' do
    User.create(username: 'Paul', password: 'test')
      visit login_path
      fill_in('session[username]', with: 'Paul')
      fill_in('session[password]', with: 'test')
      click_link_or_button("Sign in")
      expect(page).to have_content("Welcome Paul")
      click_link_or_button("log out")
      expect(page).to have_content('Goodbye')
    end


end