# frozen_string_literal: true
module Api
  module V1
    class RegistrationsController < Devise::RegistrationsController
      respond_to :json

      def create
        super
      end

      private

      # Notice the name of the method
      def sign_up_params
        params.require(:user).permit(:username, :email, :password, :password_confirmation)
      end
    end
  end
end
