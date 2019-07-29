class DriversController < ApplicationController
  before_action :set_driver, only: [:show, :edit, :update, :destroy]
  before_action :authenticate_user!, except: [:show]
   
  def index
    @drivers = current_user.agency.drivers
  end 

  def new
    @agency = current_user.agency
  end

  def show
    @agency = Agency.find(params[:agency_id])
    @driver = @agency.drivers.find(params[:id])
  end

  def create
    @agency = Agency.find(params[:agency_id])
    @driver = @agency.drivers.create(driver_params)  
    redirect_to agency_path(@agency) 
  end
 
  def update
    respond_to do |format|
      if @driver.update(driver_params)
        format.html { redirect_to @driver, notice: 'Driver was successfully updated.' }
        format.json { render :show, status: :ok, location: @driver }
      else
        format.html { render :edit }
        format.json { render json: @driver.errors, status: :unprocessable_entity }
      end
    end
  end

  def destroy
    @agency = Agency.find(params[:agency_id])
    @driver = @agency.drivers.find(params[:id])
    @driver.destroy
    redirect_to agency_path(@agency)
  end

  private
    def set_driver
      @driver = Driver.find(params[:id])
    end

    def driver_params
      params.require(:driver).permit!
    end
end
