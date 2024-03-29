class RepoFacade
  require "base64"
  require "nokogiri"

  def self.pack_coverage_file_for_FE(user_id, repo_id)
    user = User.find(user_id)
    repo = user.repos.find(repo_id)
    file_content = get_coverage_file(repo.owner, repo.name)

    # this may be a better way to handle the error??
    # if file_content.nil?
    #   return { error: "Not Found" }
    # else

    Coverage::Repo.new(
      id: repo.id,
      user: user.name,
      owner: repo.owner,
      name: repo.name,
      covered_percent: file_content[:covered_percent]
    )
    # end
  end

  def self.get_coverage_file(owner, name)
    service = GithubService.new
    response = service.get_simplecov_from_api(owner, name)
    decoded_content = decode_coverage(response)
    parse_coverage(decoded_content)
  end

  def self.decode_coverage(response)
    if response[:message] == "Not Found"
      return response = nil
    else
      decoded_content = Base64.decode64(response[:content])
      decoded_content
    end
  end

  def self.parse_coverage(content)
    if content.nil?
      return { covered_percent: "Coverage file not found." }
    else
      doc = Nokogiri::HTML(content)
      covered_percent = doc.css('.group_name + span').text.strip
      { covered_percent: covered_percent }
    end
  end

  # in case we need to convert the covered_percent to a float
  # def self.covered_percent_to_i(covered_percent)
  #   covered_percent.gsub("%", "").to_f
  # end
end