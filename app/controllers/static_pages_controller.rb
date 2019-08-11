class StaticPagesController < ApplicationController
  before_action :authenticate_user!, only: [:register_plan]

  def about
  end

  def services
  end
   
  def pricing
    @plans = Plan.order(:name)
  end

  def register_plan
    @plan = Plan.find(params[:plan_id])
  end
   
end
