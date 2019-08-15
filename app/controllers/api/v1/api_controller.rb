class Api::V1::ApiController < ActionController::API
  before_action :authenticate_user!

  attr_accessor :current_user

  def authenticate_user!
    user = Authentications::AuthenticateUser.new(request).call

    if user
      @current_user = user
    else
      render status: 401
    end
  end

  def render_with_errors(status = 422, errors)
    render json: { errors: errors }, status: status
  end

  def pagination(collection)
    {
      current_page: collection.current_page,
      total_pages: collection.total_pages,
      total_count: collection.total_entries
    }
  end
end
