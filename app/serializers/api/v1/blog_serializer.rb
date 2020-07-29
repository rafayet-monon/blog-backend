include ::Rails.application.routes.url_helpers

module Api
  module V1
    class BlogSerializer
      include FastJsonapi::ObjectSerializer

      attributes :title, :subtitle, :details

      attribute :cover_image_url do |object|
        rails_blob_url(object.cover_image, only_path: true) if object.cover_image.attached?
      end
    end
  end
end

