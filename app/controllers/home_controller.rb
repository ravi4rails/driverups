class HomeController < ApplicationController
  before_action only: [:index, :search_drivers] do 
    @q = Driver.ransack(params[:q])
  end

  def index
    @drivers = Driver.last(6)
  end 
  
  
  def search_drivers
    if params[:q][:latitude].present? && params[:q][:longitude].present?
      lat = params[:q][:latitude]
      long = params[:q][:longitude]
      @drivers = Driver.near([lat, long], 20, units: :km)
    else
      @drivers = @q.result(distinct: true)
    end
  end

end    
