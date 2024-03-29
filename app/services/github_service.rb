class GithubService
  def get_simplecov_from_api(owner, name)
    get_uri("repos/#{owner}/#{name}/contents/coverage/index.html")
  end

  def get_uri(path)
    response = conn.get(path)
    if response.status == 200
      JSON.parse(response.body, symbolize_names: true)
    else
      { error: "Not Found" }
    end
  end

  def conn #5
    Faraday.new(url: "https://api.github.com")
  end
end