require 'rails_helper'

RSpec.describe RepoAchievement, type: :model do
  it { should belong_to(:repo)}
  it { should belong_to(:achievement)}
end
