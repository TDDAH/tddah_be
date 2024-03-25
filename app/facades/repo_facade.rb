class RepoFacade
  def self.get_file(owner, name)
    service = GithubService.new
    service.get_simplecov_from_api(owner, name)
  end
end