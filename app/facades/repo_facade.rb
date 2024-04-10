class RepoFacade
  require "base64"
  require "nokogiri"

  def self.pack_coverage_file_for_FE(user_id, repo_id)
    user = User.find(user_id)
    repo = user.repos.find(repo_id)
    file_content = get_coverage_file(repo.owner, repo.name)

    if file_content.nil?
      { error: "Coverage file not found." }
    else
      Coverage::Repo.new(
        # We should drop the id from the data hash?
        id: repo.id,
        user: user.name,
        owner: repo.owner,
        name: repo.name,
        # add achievements 'nest' here??
        covered_percent: file_content[:covered_percent]
      )
    end
  end

  def self.get_coverage_file(owner, name)
    service = GithubService.new
    response = service.get_simplecov_from_api(owner, name)

    if response[:status] == 404
      nil
    else
      decoded_content = decode_coverage(response)
      parse_coverage(decoded_content)
    end
  end

  def self.decode_coverage(response)
      decoded_content = Base64.decode64(response[:content])
      decoded_content
  end

  def self.parse_coverage(content)
      doc = Nokogiri::HTML(content)
      covered_percent = doc.css('.group_name + span').text.strip
      { covered_percent: covered_percent }
  end

  # in case we need to convert the covered_percent to a float
  # def self.covered_percent_to_i(covered_percent)
  #   covered_percent.gsub("%", "").to_f
  # end
end