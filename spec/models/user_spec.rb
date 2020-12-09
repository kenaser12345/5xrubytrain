require 'rails_helper'

RSpec.describe User, type: :model do
  it "is valid with a first name, last name, email, and password" do
    user = User.new(
      name: "Ken",
      email: "ken@example.com",
      password: "ken12345"
    )
  expect(user).to be_valid
  end

  it "is invalid without a name" do
    user = User.create(name: nil)
    user.valid?
    expect(user.errors[:name]).to include("can't be blank")
  end

  it "is invalid without an email address" do
    user = User.create(name: "ken", email: nil)
    user.valid?
    expect(user.errors[:email]).to include("can't be blank")
  end 

  it "is invalid with a duplicate email address" do 
    User.create(
      name: "ken",
      email: "ken123@example.com",
      password: "ken12345"
    )
    user = User.new(
      name: "kenny",
      email: "ken123@example.com",
      password: "kenny12345",
    )
    user.valid?
    expect(user.errors[:email]).to include("has already been taken")
  end
  
  it "returns a user's full name as a string"
end
