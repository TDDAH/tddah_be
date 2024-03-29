class Api::V1::ReposController < ApplicationController
  # just for a place for repos to be stored
  def index; end

  # GET /api/v1/users/:user_id/repos/:id
  def show
    result = RepoFacade.pack_coverage_file_for_FE(params[:user_id], params[:id])

    if result.is_a?(Hash) && result[:error]
      # need to comment out the status because it is a weird frakenstien of a response
      render json: { error: result[:error] }#, status: :not_found
    else
      render json: RepoSerializer.new(result)
    end
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