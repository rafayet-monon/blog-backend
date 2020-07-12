module Api
  module V1
    class BaseController < ApplicationController

      private

      def current_api_v1_user
        @current_user ||= super || User.find(@current_user_id)
      end

      alias_method :current_user, :current_api_v1_user
    end
  end
end