class Feature < ApplicationRecord
 has_many :plan_features, dependent: :destroy
 has_many :plans, through: :plan_features
 validates :title, presence: true
end
