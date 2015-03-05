require 'rails_helper'

RSpec.describe "User Roles" do 
  include Capybara::DSL
  it "has a role" do
    user = User.create(username: 'Paul', password: 'test', role: 0)
    expect(user.role).to eq("default")
    
  end
end