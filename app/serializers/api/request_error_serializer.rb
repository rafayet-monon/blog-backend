module Api
  class RequestErrorSerializer
    include FastJsonapi::ErrorSerializer

    attributes :title,
               :detail,
               :code,
               :status,
               :serializer_source
  end
end