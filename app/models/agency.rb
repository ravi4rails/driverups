class Agency < ApplicationRecord
 belongs_to :user, optional: true
 has_many :drivers, dependent: :destroy
 validates :name, :cover_image, :logo, :base_fare, presence: :true
 mount_uploader :cover_image, ImageUploader
 mount_uploader :logo, ImageUploader
 
 before_create do 
    self.is_subscribed = false
 end
 
 def subscribed?
    is_subscribed
  end

end
