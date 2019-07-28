class Driver < ApplicationRecord
  geocoded_by :address
  after_validation :geocode
  belongs_to :agency, optional: true
  mount_uploader :profile_image, ImageUploader
  validates :first_name, :last_name, :contact_1, :contact_2, :city, :state, :country, :address, :id_proof, :additional_id, :profile_image, presence: :true
  
  def full_name
    "#{first_name}" + " " + "#{last_name}"
  end
end
