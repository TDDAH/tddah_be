class Api::V1::ReposController < ApplicationController

  # GET /api/v1/users/:user_id/repos/:id
  def show
    user = User.find(params[:id])
    repo = user.repos.find(params[:user_id])
    file_content = RepoFacade.get_coverage_file(repo.owner, repo.name)
    render json: RepoSerializer.new(file_content, {params: {owner: repo.owner, name: repo.name}})
  end
end