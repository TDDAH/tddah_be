class GithubService
  def get_simplecov_from_api(owner, name)
    get_uri("repos/#{owner}/#{name}/contents/coverage/index.html")
  end

  def get_uri(path)
    response = conn.get(path) 

    case response.status
    when 200
      JSON.parse(response.body, symbolize_names: true)
    when 404
      { error: "Coverage file not found in repo", status: 404 }
    else
      { error: "An unexpected error occurred", status: response.status }
    end
  end

  def conn #5
    Faraday.new(url: "https://api.github.com")
  end
end