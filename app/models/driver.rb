class Driver < ApplicationRecord
  belongs_to :agency, optional: true
  validates :first_name, :last_name, :contact_1, :conatct_2, :city, :state, :country, :address, :id_proof, :additional_id, :profile_image, presence: :true
end
