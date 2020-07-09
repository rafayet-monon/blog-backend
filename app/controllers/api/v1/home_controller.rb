# frozen_string_literal: true

module Api
  module V1
    class HomeController < Api::V1::BaseController
      before_action :authenticate_user!

      def index
        render json: { success: true }
      end
    end
  end
end