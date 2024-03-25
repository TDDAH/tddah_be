require "rails_helper"

RSpec.describe "GithubService" do
  it "does the things" do
    owner = "s2an"
    name = "lunch_and_learn_be_7"
    
    results = GithubService.new.get_simplecov_from_api(owner, name)

    # expect(results).to be_a(Faraday::Response)
    expect(results).to be_a(Hash)
    expect(results).to have_key(:name)
    expect(results).to have_key(:content)
  end

  it "hacks the contents" do
    owner = "s2an"
    name = "lunch_and_learn_be_7"
    
    results = GithubService.new.get_simplecov_from_api(owner, name)
require "pry"; binding.pry
    decoded_content = RepoFacade.hack_the_code(results)
    expect(decoded_content).not_to be_nil
  end
end