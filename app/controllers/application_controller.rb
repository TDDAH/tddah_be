class ApplicationController < ActionController::API
  rescue_from ActiveRecord::RecordNotFound, with: :not_found_response 
  rescue_from ActiveRecord::RecordInvalid, with: :unprocessable_entity_response

private

  # when a query is used and no record of an ID exists 
  def not_found_response(exception) 
    render json: ErrorSerializer.new(ErrorMessage.new(exception.message, 404))
      .serialize_json, status: :not_found
  end

  # when a model fails upon saving (save, create, update)
  def unprocessable_entity_response(exception)
    render json: ErrorSerializer.new(ErrorMessage.new(exception.message, 422))
      .serialize_json, status: :unprocessable_entity
  end
end