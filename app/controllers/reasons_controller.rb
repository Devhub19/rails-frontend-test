class ReasonsController < ApplicationController
  before_action :set_reason, only: %i[ edit update ]


  def index
    @reasons = Reason.all
  end


  def show
  end


  def new
    
    @reason = @storefront.reasons.new
  end


  def edit    
  end

  def update
    @storefront = @reason.storefront
    respond_to do |format|
      if @reason.update(reason_params)
		format.turbo_stream
		
        format.html { redirect_to [:edit, @storefront], notice: "Reason was successfully updated." }
        format.json { render :edit, status: :ok, location: @storefront }
      else
        format.html { render :edit, status: :unprocessable_entity }
        format.json { render json: @reason.errors, status: :unprocessable_entity }
      end
    end
  end

  private
  # Use callbacks to share common setup or constraints between actions.
  def set_reason
    @reason = Reason.find(params[:id])
  end

  def reason_params
  	params.require(:reason).permit(:label, :code, :active, :ordering)
  end
end
