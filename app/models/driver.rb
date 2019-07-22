class Driver < ApplicationRecord
  belongs_to :agency, optional: true
end
