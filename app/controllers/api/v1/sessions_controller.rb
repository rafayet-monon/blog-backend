# frozen_string_literal: true
module Api
  module V1
    class SessionsController < Devise::SessionsController
      respond_to :json

      def create
        byebug
        user = User.find_by_email(sign_in_params[:email])

        if user && user.valid_password?(sign_in_params[:password])
          @current_user = user
        else
          render json: { errors: { 'email or password' => ['is invalid'] } }, status: :unprocessable_entity
        end
      end

      private

      # Notice the name of the method
      def sign_in_params
        params.require(:user).permit(:email, :password)
      end

      def respond_with(resource, _opts = {})
        render json: resource
      end

      def respond_to_on_destroy
        head :ok
      end
    end
  end
end
