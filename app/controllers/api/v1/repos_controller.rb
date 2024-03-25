class Api::V1::ReposController < ApplicationController

  # GET /api/v1/repos/:id
  def show
    repo = Repo.find(params[:id])
    render json: RepoSerializer.new(repo)
  end
end