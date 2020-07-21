module Api
  module V1
    class UsersController < BaseController
      before_action :authenticate_user!

      def show
        render json: Api::V1::UserProfileSerializer.new(current_user).serializable_hash
      end

      def update
        if current_user.update_attributes(user_params)
          render :show
        else
          render json: { errors: current_user.errors }, status: :unprocessable_entity
        end
      end

      private

      def user_params
        params.require(:user).permit(:username, :email, :password, :bio, :image)
      end
    end
  end
end
