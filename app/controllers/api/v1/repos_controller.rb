class Api::V1::ReposController < ApplicationController

  # GET /api/v1/users/:user_id/repos/:id
  def show
    render json: RepoFacade.package_coverage_file_for_FE(params[:user_id], params[:id])
  end
end