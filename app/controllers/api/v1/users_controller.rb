class Api::V1::UsersController < Api::V1::ApiController
  skip_before_action :authenticate_user!, only: [:index]

  def index
    users = User.filter(filter_params)

    render json: {
      users: ActiveModelSerializers::SerializableResource.new(users, each_serializer: UsersSerializer),
      pagination: {
        total: users.count,
        current_page: filter_params[:page].to_i
      }
    }
  end

  def update
    @current_user.update(user_params)

    if @current_user.errors.empty?
      render json: @current_user
    else
      render_with_errors(200, @current_user.errors.as_json(full_messages: true))
    end
  end

  private

  def filter_params
    params.permit(:page, :per_page)
  end

  def user_params
    params.require(:user).permit(:name, :surname, :email, :phone_number, :avatar)
  end
end
