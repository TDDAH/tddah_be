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
    decoded_content = RepoFacade.decode_coverage(results)
    parsed_content = RepoFacade.parse_coverage(decoded_content)

    expect(decoded_content).not_to be_nil
    expect(parsed_content).not_to be_nil
    expect(parsed_content[:coverage_summary]).to eq("86.05%")
  end
end