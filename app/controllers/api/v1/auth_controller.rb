class Api::V1::AuthController < Api::V1::ApiController
  skip_before_action :authenticate_user!

  def sign_in
    user = User.find_by(email: user_params[:email].downcase)
    authenticated = user.try(:authenticate, user_params[:password])

    if authenticated
      render json: user, serializer: UserSerializer
    else
      render_with_errors(200, user ? { password: 'Wrong password' } : { email: 'Wrong email' })
    end
  end

  def sign_up
    user = User.create(user_params)

    if user.errors.empty?
      head :ok
    else
      render_with_errors(200, user.errors.as_json(full_messages: true))
    end
  end

  def user_params
    params.require(:user).permit(:email, :password, :password_confirmation)
  end
end
