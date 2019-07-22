class Agency < ApplicationRecord
 belongs_to :users, optional: true
 has_many :drivers
end
