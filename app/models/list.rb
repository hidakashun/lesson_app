class List < ApplicationRecord

  has_many_attached :list_images

  FILE_NUMBER_LIMIT = 3

  validate :validate_number_of_files

  private

  def validate_number_of_files
  return if list_images.length <= FILE_NUMBER_LIMIT
  errors.add(:list_images,"に添付できる画像は#{FILE_NUMBER_LIMIT}件までです。")
  end
end
