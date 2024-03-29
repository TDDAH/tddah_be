require "rails_helper"

RSpec.describe Repo, type: :model do
  describe "validations" do
    it { should validate_presence_of(:owner) }
    it { should validate_presence_of(:name) }
    it { should belong_to(:user) }
  end

  it "exists" do
    repo = Repo.new
    expect(repo).to be_an_instance_of(Repo)
  end

end
