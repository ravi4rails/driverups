class AgenciesController < ApplicationController
  before_action :set_agency, only: [:show, :edit, :update, :destroy]
  before_action :authenticate_user!

  def show
    @agency = current_user.agency
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
        format.html { redirect_to @agency, notice: 'Agency was successfully created.' }
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
        format.html { redirect_to @agency, notice: 'Agency was successfully updated.' }
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
      format.html { redirect_to agencies_url, notice: 'Agency was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    def set_agency
      @agency = Agency.find(params[:id])
    end

    def agency_params
      params.require(:agency).permit(:name, :cover_image, :logo, :user_id)
    end
end
