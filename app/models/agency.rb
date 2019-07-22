class Agency < ApplicationRecord
   belongs_to :users
   has_many :drivers
end
