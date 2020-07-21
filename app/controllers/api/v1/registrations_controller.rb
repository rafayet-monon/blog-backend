# frozen_string_literal: true
module Api
  module V1
    class RegistrationsController < Devise::RegistrationsController
      respond_to :json

      def create
        build_resource(sign_up_params)

        resource.save
        yield resource if block_given?
        if resource.persisted?
          if resource.active_for_authentication?
            set_flash_message! :notice, :signed_up
            sign_up(resource_name, resource)
            render json: Api::V1::SignupSerializer.new(resource).serializable_hash
          else
            set_flash_message! :notice, :"signed_up_but_#{resource.inactive_message}"
            expire_data_after_sign_in!
            respond_with resource, location: after_inactive_sign_up_path_for(resource)
          end
        else
          clean_up_passwords resource
          set_minimum_password_length
          error = ::CustomErrorService.new(source: 'signup', title: resource.errors.full_messages.to_sentence, code: 'err_002',
                                           status: 422)

          render json: Api::RequestErrorSerializer.new(error).serialized_json, status: 422
        end
      end

      private

      # Notice the name of the method
      def sign_up_params
        params.require(:user).permit(:username, :email, :password, :password_confirmation)
      end
    end
  end
end
