module Admin
  class AgenciesController < BaseController
    before_action :set_agency, only: [:show, :edit, :update, :destroy]
    load_and_authorize_resource
    before_action :authenticate_user!

    def index
      @agencies = Agency.all
      @q = Agency.ransack(params[:q])
      @agencies = @q.result(distinct: true)
    end

    def show
    end

    def new
      @agency = Agency.new
    end

    def edit
    end

    def create
      @agency = Agency.new(agency_params)

      respond_to do |format|
        if @agency.save
          format.html { redirect_to admin_agencies_path, notice: 'Agency was successfully created.' }
          format.json { render :show, status: :created, location: @agency }
        else
          format.html { render :new }
          format.json { render json: @agency.errors, status: :unprocessable_entity }
        end
      end
    end

    def update
      respond_to do |format|
        if @agency.update(agency_params)
          format.html { redirect_to admin_agencies_path, notice: 'Agency was successfully updated.' }
          format.json { render :show, status: :ok, location: @agency }
        else
          format.html { render :edit }
          format.json { render json: @agency.errors, status: :unprocessable_entity }
        end
      end
    end

    def destroy
      @agency.destroy
      respond_to do |format|
        format.html { redirect_to admin_agencies_url, notice: 'Agency was successfully destroyed.' }
        format.json { head :no_content }
      end
    end

    private
    
      def set_agency
        @agency = Agency.find(params[:id])
      end

      def agency_params
        params.require(:agency).permit(:name, :cover_image, :logo)
      end
  end
end