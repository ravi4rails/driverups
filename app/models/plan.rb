class Plan < ApplicationRecord
  has_many :plan_features, dependent: :destroy
  has_many :features, through: :plan_features

  validates :name, presence: true
end
