require 'rails_helper'

RSpec.describe Task, type: :model do
  it "Do not allow duplicate task names per user" do
    user = User.create(
      name: "ken",
      email: "ken@example.com",
      password: "ken12345"
    )
    user.tasks.create(
      name: "test1"
    )
    new_task = user.tasks.create(
      name: "test1"
    )
    new_task.valid?
    expect(new_task.errors[:name]).to include("has already been taken")
  end

  it "allows two users to share a project name" do
    user = User.create(
      name: "ken",
      email: "ken@example.com",
      password: "ken12345"
    )
    user.tasks.create(
      name: "test1"
    )
    other_user = User.create(
      name: "kenny",
      email: "kenny@example.com",
      password: "kenny12345"
    )
    other_task = other_user.tasks.create(
      name: "test1"
    )
    expect(other_task).to be_valid
  end
end
