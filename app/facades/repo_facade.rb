class RepoFacade
  require "base64"
  require "nokogiri"

  def self.get_file(owner, name)
    service = GithubService.new
    service.get_simplecov_from_api(owner, name)
  end

  def self.decode_coverage(response)
    decoded_content = Base64.decode64(response[:content])
    decoded_content
  end

  def self.parse_coverage(content)
    doc = Nokogiri::HTML(content)
    coverage_summary = doc.css('.group_name + span').text.strip
    { coverage_summary: coverage_summary }
  end
end