class GithubService
  def get_simplecov_from_api(owner, name)
    get_uri("repos/#{owner}/#{name}"/contents/coverage/index.html)
  end

  def get_uri(path)
    response = conn.get(path) 
    JSON.parse(response.body, symbolize_names: true)
  end

  def conn #5
    Faraday.new(url: "https://api.github.com")
  end
end