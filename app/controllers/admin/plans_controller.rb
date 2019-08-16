module Admin
  class PlansController < ApplicationController
  layout 'admin'
  before_action :set_plan, only: [:show, :edit, :update, :destroy]
  before_action :authenticate_user!

  def index
    @q = Plan.ransack(params[:q])
    @plans = @q.result(distinct: true)
  end

  def show;end

  def new
    @plan = Plan.new
  end

  def edit;end

  def create
    @plan = Plan.new(plan_params)
    respond_to do |format|
      if @plan.save
        if params[:plan][:features].present?
          params[:plan][:features].each do |feature_id|
            @plan.plan_features.create(feature_id: feature_id)
          end
        end
        format.html { redirect_to admin_plan_path(@plan), notice: 'Plan was successfully created.' }
        format.json { render :show, status: :created, location: @plan }
      else
        format.html { render :new }
        format.json { render json: @plan.errors, status: :unprocessable_entity }
      end
    end
  end

  def update
    if params[:plan][:plan_feature_remove].present?
      id_param_arr = params[:plan][:plan_feature_remove].map {|i| i.to_i}
      if @plan.features.ids.uniq != id_param_arr
        diff_arr = @plan.features.ids - id_param_arr
        @plan.plan_features.where('feature_id IN (?)', diff_arr).destroy_all
      end
    else 
      @plan.plan_features.destroy_all
    end
    if params[:plan][:features].present?
      params[:plan][:features].each do |feature_id|
        @plan.plan_features.create(feature_id: feature_id)
      end
    end
    respond_to do |format|
      if @plan.update(plan_params)
        format.html { redirect_to admin_plan_path, notice: 'Plan was successfully updated.' }
        format.json { render :show, status: :ok, location: @plan }
      else
        format.html { render :edit }
        format.json { render json: @plan.errors, status: :unprocessable_entity }
      end
    end
  end

  def destroy
    @plan.destroy
    respond_to do |format|
      format.html { redirect_to admin_plans_path, notice: 'Plan was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    def set_plan
      @plan = Plan.find(params[:id])
    end

    def plan_params
      params.require(:plan).permit(:name, :price)
    end
  end
end
