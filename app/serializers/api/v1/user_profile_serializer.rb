module Api
  module V1
    class UserProfileSerializer
      include FastJsonapi::ObjectSerializer

      attributes :email, :username, :bio, :image
    end
  end
end
