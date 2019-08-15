module Authentications
  class AuthenticateUser
    def initialize(request)
      @request = request
    end

    def call
      token, options = ActionController::HttpAuthentication::Token.token_and_options(@request)

      user_email = options.blank? ? nil : options[:email]
      user = User.find_by(email: user_email) if user_email

      user if user && ActiveSupport::SecurityUtils.secure_compare(user.token, token)
    end
  end
end
