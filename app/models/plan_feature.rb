class PlanFeature < ApplicationRecord
  belongs_to :plan, optional: true
  belongs_to :feature, optional: true
end
