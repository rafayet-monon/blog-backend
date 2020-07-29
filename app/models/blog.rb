class Blog < ApplicationRecord
  belongs_to :user
  has_one_attached :cover_image

  validates_presence_of :title, :subtitle, :details
  validate :acceptable_image

  private

  def acceptable_image
    return unless cover_image.attached?

    unless cover_image.byte_size <= 5.megabyte
      errors.add(:main_image, 'is too big')
    end

    acceptable_types = %w[image/jpeg image/png image/jpg]
    unless acceptable_types.include?(cover_image.content_type)
      errors.add(:main_image, 'must be a JPEG, JPG or PNG')
    end
  end
end
