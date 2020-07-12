class ApplicationController < ActionController::API
  include ActionController::HttpAuthentication::Basic::ControllerMethods
  include ActionController::HttpAuthentication::Token::ControllerMethods

  respond_to :json
  before_action :authenticate_user

  private

  def authenticate_user
    if request.headers['Authorization'].present?
      authenticate_or_request_with_http_token do |token|
        begin
          jwt_payload = JWT.decode(token, Rails.application.credentials[:jwt_secret_key]).first

          @current_user_id = jwt_payload['id']
        rescue JWT::ExpiredSignature, JWT::VerificationError, JWT::DecodeError
          head :unauthorized
        end
      end
    end
  end

  def authenticate_user!(options = {})
    head :unauthorized unless signed_in?
  end

  def signed_in?
    @current_user_id.present?
  end
end
