class Agency < ApplicationRecord
 belongs_to :user, optional: true
 has_many :drivers, dependent: :destroy
 validates :name, :cover_image, :logo, presence: :true
 mount_uploader :cover_image, ImageUploader
 mount_uploader :logo, ImageUploader
end
