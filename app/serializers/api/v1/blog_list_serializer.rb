class Api::V1::BlogListSerializer
  include FastJsonapi::ObjectSerializer
  attributes :title, :subtitle

  attribute :posted_at do |object|
    object.created_at.strftime('%A, %d %b %Y %l:%M %p')
  end

  attribute :posted_by do  |object|
    object.user.username
  end
end
