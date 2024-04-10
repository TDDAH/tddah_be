require "rails_helper"

RSpec.describe Achievement, type: :model do
  describe "validations" do
    it { should validate_presence_of(:name) }
    it { should validate_presence_of(:criteria) }
    it { should have_many(:repo_achievements) }
    it { should have_many(:repos).through(:repo_achievements) }

  end

end
