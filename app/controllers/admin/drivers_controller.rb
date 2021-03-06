module Admin
  class DriversController < BaseController
    before_action :set_driver, only: [:show, :edit, :update, :destroy]
    before_action :authenticate_user!
    load_and_authorize_resource
    
    def index
      @drivers = Driver.all
      @q = Driver.ransack(params[:q])
      @drivers = @q.result(distinct: true)
    end

    def show
    end

    def new
      @driver = Driver.new
    end

    def edit
    end

    def create
      @driver = Driver.new(driver_params)

      respond_to do |format|
        if @driver.save
          format.html { redirect_to admin_drivers_path, notice: 'Driver was successfully created.' }
          format.json { render :show, status: :created, location: @driver }
        else
          format.html { render :new }
          format.json { render json: @driver.errors, status: :unprocessable_entity }
        end
      end
    end

    def update
      respond_to do |format|
        if @driver.update(driver_params)
          format.html { redirect_to admin_drivers_path, notice: 'Driver was successfully updated.' }
          format.json { render :show, status: :ok, location: @driver }
        else
          format.html { render :edit }
          format.json { render json: @driver.errors, status: :unprocessable_entity }
        end
      end
    end

    def destroy
      @driver.destroy
      respond_to do |format|
        format.html { redirect_to admin_drivers_url, notice: 'Driver was successfully destroyed.' }
        format.json { head :no_content }
      end
    end

    private
    
      def set_driver
        @driver = Driver.find(params[:id])
      end

      def driver_params
        params.require(:driver).permit!
      end
  end
end
