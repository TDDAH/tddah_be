require "rails_helper"

RSpec.describe User, type: :model do
  describe 'validations' do
    it { should validate_presence_of(:name)}
    it { should validate_presence_of(:email)}
    it { should validate_uniqueness_of(:email)}
    it { should validate_presence_of(:password)}
    it { should validate_presence_of(:password_confirmation)}
    it { should have_many(:repos) }

  end

  it "exists" do
    user = User.new
    expect(user).to be_an_instance_of(User)
  end
end
