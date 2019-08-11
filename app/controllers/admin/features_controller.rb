module Admin
  class FeaturesController < ApplicationController
    layout 'admin'
    before_action :set_feature, only: [:show, :edit, :update, :destroy]
    before_action :authenticate_user!
    def index
      @features = Feature.all
    end

    def show;end

    def new
      @feature = Feature.new
    end

    def edit;end

    def create
      @feature = Feature.new(feature_params)
      respond_to do |format|
        if @feature.save
          format.html { redirect_to admin_feature_path(@feature), notice: 'feature was successfully created.' }
          format.json { render :show, status: :created, location: @feature }
        else
          format.html { render :new }
          format.json { render json: @Feature.errors, status: :unprocessable_entity }
        end
      end
    end

    def update
      respond_to do |format|
        if @feature.update(feature_params)
          format.html { redirect_to admin_feature_path(@feature), notice: 'feature was successfully updated.' }
          format.json { render :show, status: :ok, location: @feature }
        else
          format.html { render :edit }
          format.json { render json: @Feature.errors, status: :unprocessable_entity }
        end
      end
    end

    def destroy
      @feature.destroy
      respond_to do |format|
        format.html { redirect_to admin_features_path, notice: 'feature was successfully destroyed.' }
        format.json { head :no_content }
      end
    end

    private
      def set_feature
        @feature = Feature.find(params[:id])
      end

      def feature_params
        params.require(:feature).permit(:title)
      end
  end
end