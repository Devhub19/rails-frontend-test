class StorefrontsController < ApplicationController
  before_action :set_storefront, only: %i[ show edit update destroy]

  # GET /storefronts or /storefronts.json
  def index
    @storefronts = Storefront.all
  end

  def update_position
    reason = Reason.where(id: params[:id]).first
    reason.insert_at(params[:position].to_i)
    head :ok
  end

  def edit_reason
    @reasons = Reason.find_by(id: params['id'])
    @storefront = @reasons.storefront
    @reasons.update(label: params['reason']['label'],code: params['reason']['code'], active: params['reason']['_destroy'])
    respond_to do |format|
      format.html { redirect_to root_url(@storefront), notice: "Storefront was successfully created." }
      format.js { render inline: "location.reload();" }
    end
  end

  # GET /storefronts/1 or /storefronts/1.json
  def show
  end

  # GET /storefronts/new
  def new
    @storefront = Storefront.new
  end

  # GET /storefronts/1/edit
  def edit
  end

  # POST /storefronts or /storefronts.json
  def create
    @storefront = Storefront.new(storefront_params)
    respond_to do |format|
      if @storefront.save
        format.html { redirect_to storefront_url(@storefront), notice: "Storefront was successfully created." }
        format.json { render :show, status: :created, location: @storefront }
      else
        format.html { render :new, status: :unprocessable_entity }
        format.json { render json: @storefront.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /storefronts/1 or /storefronts/1.json
  def update
    respond_to do |format|
      if @storefront.update(storefront_params)
        format.html { redirect_to "/storefront", notice: "Storefront was successfully updated." }
        format.json { render :edit, status: :ok, location: @storefront }
      else
        format.html { render :edit, status: :unprocessable_entity }
        format.json { render json: @storefront.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /storefronts/1 or /storefronts/1.json
  def destroy
    @storefront.destroy!

    respond_to do |format|
      format.html { redirect_to storefronts_url, notice: "Storefront was successfully destroyed." }
      format.json { head :no_content }
    end
  end

  def edit_reasons
    @reason = Reason.find(params[:id])
    @storefront = @reason.storefront
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_storefront
      @storefront = Storefront.find(params[:id])
    end

    # Only allow a list of trusted parameters through.
    def storefront_params
      params.fetch(:storefront, {}).permit(
      :name,
        {
          reasons_attributes: [
            :id,
            :code,
            :label,
            :ordering,
            :active,
            :_destroy,
            :position,
            { restricted_resolution_types: [] }
          ]
        }
      )
    end
end
