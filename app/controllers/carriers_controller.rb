# frozen_string_literal: true

class CarriersController < ApplicationController
  before_action :set_carrier, only: %i[show update destroy]

  # GET /carriers
  def index
    @carriers = Carrier.all

    render json: @carriers
  end

  # GET /carriers/1
  def show
    render json: @carrier
  end

  # POST /carriers
  def create
    @carrier = Carrier.new(carrier_params)

    if @carrier.save
      render json: @carrier, status: :created, location: @carrier
    else
      render json: @carrier.errors, status: :unprocessable_entity
    end
  end

  # PATCH/PUT /carriers/1
  def update
    if @carrier.update(carrier_params)
      render json: @carrier
    else
      render json: @carrier.errors, status: :unprocessable_entity
    end
  end

  # DELETE /carriers/1
  def destroy
    @carrier.destroy
  end

  def update_tracking
    @carrier = Carrier.find(params[:carrier_id])
    if @carrier
      tracking = Tracking.new(tracking_params)
      if tracking.save
        @carrier.trackings << tracking
      else
        render(json: tracking.errors, status: :unprocessable_entity) && return
      end
      render json: @carrier.trackings if @carrier.save
    else
      render json: @carrier.errors, status: :unprocessable_entity
    end
  end

  def passed_by
    if params[:latitude] && params[:longitude]
      @carriers = Carrier.joins(:trackings).where(
        trackings: { latitude: params[:latitude],
                     longitude: params[:longitude] }
      )
      render json: @carriers
    else
      render json: 'Parameters incomplete', status: :unprocessable_entity
    end
  end

  private

  # Use callbacks to share common setup or constraints between actions.
  def set_carrier
    @carrier = Carrier.find(params[:id])
  end

  def tracking_params
    params.require(:tracking).permit(:longitude, :latitude, :altitude)
  end

  # Only allow a trusted parameter "white list" through.
  def carrier_params
    params.require(:carrier).permit(:name, :age, :has_driver_licence_a, :has_driver_licence_b, :has_driver_licence_c)
  end
end
