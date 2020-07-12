module Api
  module V1
    class LoginSerializer
      include FastJsonapi::ObjectSerializer

      attributes :email, :username, :bio, :image

      attribute :token, &:generate_jwt
    end
  end
end
