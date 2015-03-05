require 'rails_helper'

RSpec.describe User, type: :model do
  let(:user) {User.create(username: 'Paul', password: 'Grever')} 
  

  it "exists" do
    expect(user).to be_valid
  end

  it "is invalid without a username" do
    user.username = nil
    expect(user).to_not be_valid
  end

  it "is invalid without a password" do
    user.password = nil
    expect(user).to_not be_valid
  end

end
