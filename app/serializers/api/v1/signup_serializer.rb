module Api
  module V1
    class SignupSerializer
      include FastJsonapi::ObjectSerializer

      attributes :email, :username, :bio, :image

      attribute :token, &:generate_jwt
    end
  end
end
