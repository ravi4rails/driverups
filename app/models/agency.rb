class Agency < ApplicationRecord
 belongs_to :users, optional: true
 has_many :drivers
 validates :name, :cover_image, :logo, presence: :true
 mount_uploader :cover_image, ImageUploader
 mount_uploader :logo, ImageUploader
end
