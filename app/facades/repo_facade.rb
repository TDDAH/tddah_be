class RepoFacade
  require "base64" # <-- inbuilt RoR
  
  def self.get_file(owner, name)
    service = GithubService.new
    service.get_simplecov_from_api(owner, name)
  end

  def self.hack_the_code(response)
    decoded_content = Base64.decode64(response[:content])
    decoded_content
  end

end