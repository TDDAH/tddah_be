require "rails_helper"

RSpec.describe User, type: :model do
  it "exists" do
    user = User.new
    expect(user).to be_an_instance_of(User)
  end
end
