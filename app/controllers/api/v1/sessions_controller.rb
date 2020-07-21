# frozen_string_literal: true
module Api
  module V1
    class SessionsController < Devise::SessionsController
      respond_to :json

      def create
        user = User.find_by_email(sign_in_params[:email])

        if user&.valid_password?(sign_in_params[:password])
          render json: Api::V1::LoginSerializer.new(user).serializable_hash
        else
          error = ::CustomErrorService.new(source: 'login', title: 'Invalid Email or Password', code: 'err_001',
                                           status: 422)

          render json: Api::RequestErrorSerializer.new(error).serialized_json, status: 422
        end
      end

      private

      # Notice the name of the method
      def sign_in_params
        params.require(:user).permit(:email, :password)
      end

      def respond_to_on_destroy
        head :ok
      end
    end
  end
end
