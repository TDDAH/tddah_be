require "rails_helper"

RSpec.describe "GithubService" do

  before(:each) do
    owner = "s2an"
    name = "lunch_and_learn_be_7"
    @results = GithubService.new.get_simplecov_from_api(owner, name)
  end

  it "gets the coverage file from GitHub" do
    expect(@results).to be_a(Hash)
    expect(@results).to have_key(:name)
    expect(@results).to have_key(:content)
  end

  it "decodes the coverage file" do
    decoded_content = RepoFacade.decode_coverage(@results)
    
    expect(decoded_content).not_to be_nil
    expect(decoded_content).to be_a(String)
  end
  
  it "parses the decoded coverage file" do
    decoded_content = RepoFacade.decode_coverage(@results)
    parsed_content = RepoFacade.parse_coverage(decoded_content)

    expect(parsed_content).not_to be_nil
    expect(parsed_content[:covered_percent]).to eq("86.05%")
  end
end