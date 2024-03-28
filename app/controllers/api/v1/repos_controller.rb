class Api::V1::ReposController < ApplicationController
  # just for a place for repos to be stored
  def index

  end

  # GET /api/v1/users/:user_id/repos/:id
  def show
    render json: RepoSerializer.new(RepoFacade.pack_coverage_file_for_FE(params[:user_id], params[:id]))
  end

  # POST /api/v1/users/:user_id/repos
  def create
    user = User.find(params[:user_id])
    repo = user.repos.new(repo_params)

    if repo.save
      render json: repo, status: :created
    else
      render json: repo.errors, status: :unauthorized
    end
  end



  private

  def repo_params
    params.permit(:owner, :name)
  end
end