class Api::V1::ReposController < ApplicationController

  # GET /api/v1/users/:user_id/repos/:id
  def show
    user_id = params[:user_id]
    repo_id = params[:id]
    render json: RepoFacade.package_coverage_file_for_FE(user_id, repo_id)
    # user = User.find(params[:user_id])
    # repo = user.repos.find(params[:id])
    # file_content = RepoFacade.get_coverage_file(repo.owner, repo.name)
    # # require "pry"; binding.pry
    # # render json: RepoSerializer.new(file_content).serializable_hash.to_json
    # render json: RepoSerializer.new(file_content, {params: {owner: repo.owner, name: repo.name}}).serializable_hash.to_json
  end
end