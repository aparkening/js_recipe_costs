class ApplicationController < ActionController::API
  # Display custom errors
  rescue_from ActiveRecord::RecordNotFound, with: :unauthorized_error
  rescue_from AuthorizationError, with: :unauthorized_error

  # Default index
  def index
    render json: { message: "Welcome Home!" }
  end

  # Render json or throw errors
  def render_resource(resource)
    if resource.errors.empty?
      render json: resource
    else
      validation_error(resource)
    end
  end

  ### Error messages
  def validation_error(resource)
    render json: {
      errors: [
        {
          status: '400',
          title: 'Bad Request',
          detail: resource.errors,
          code: '100'
        }
      ]
    }, status: :bad_request
  end

  def authorize_owner_resource(resource)
    raise AuthorizationError.new if resource.owner != current_owner
  end

  def unauthorized_error
    render json: { message: 'You are not authorized to make that request'}, status: 401
  end

  def not_found
    reunder json: { message: 'Resource not found'}, status: 404
  end

end
