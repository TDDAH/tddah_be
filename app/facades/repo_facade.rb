class RepoFacade
  require "base64"
  require "nokogiri"

  def self.get_file(owner, name)
    service = GithubService.new
    response = service.get_simplecov_from_api(owner, name)
    decoded_content = decode_coverage(response)
    parse_coverage(decoded_content)
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

  # def self.covered_percent_to_i(covered_percent)
  #   covered_percent.gsub("%", "").to_f
  # end
end