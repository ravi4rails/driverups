class Driver < ApplicationRecord
  geocoded_by :address
  after_validation :geocode
  belongs_to :agency, optional: true
  has_many :bookings, dependent: :destroy
  mount_uploader :profile_image, ImageUploader
  validates :first_name, :last_name, :contact_1, :contact_2, :city, :state, :country, :address, :id_proof, :additional_id, :additional_proof, presence: :true
  

  PROOF = ['Adhar card', 'Pan card']

  def full_name
    "#{first_name}" + " " + "#{last_name}"
  end

end
