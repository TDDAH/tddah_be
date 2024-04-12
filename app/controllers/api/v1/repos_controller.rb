class Api::V1::ReposController < ApplicationController
  # GET /api/v1/users/:user_id/repos
  def index
    user = User.find(params[:user_id])
    repos = user.repos

    serialized_repos = repos.map do |repo|
      
      result = RepoFacade.pack_coverage_file_for_FE(params[:user_id], repo.id)

      if result.is_a?(Hash) && result[:error]
        { id: repo.id, error: result[:error] }
      else
        RepoSerializer.new(result)
      end
    end
    render json: serialized_repos
  end

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

  # DELETE /api/v1/users/:user_id/repos/:id
  def destroy
    user = User.find(params[:user_id])
    repo = user.repos.find(params[:id])
    repo.destroy!
  end

  private

  def repo_params
    params.permit(:owner, :name)
  end
end