# frozen_string_literal: true

class TransportersController < ApplicationController
  before_action :set_transporter, only: %i[show update destroy]

  # GET /transporters
  def index
    @transporters = Transporter.all

    render json: @transporters
  end

  # GET /transporters/1
  def show
    render json: @transporter
  end

  # POST /transporters
  def create
    hash = transporter_params
    hash = JSON.parse(transporter_params) if hash.is_a?(String)
    @transporter = Transporter.new(hash.except(:carriers))

    hash["carriers"].each do |c|
      carrier = Carrier.new(c)
      if carrier.save
        @transporter.carriers << carrier
      else
        render json: carrier.errors, status: :unprocessable_entity and return
      end
    end
    if @transporter.save
      render json: @transporter, status: :created, location: @transporter
    else
      render json: @transporter.errors, status: :unprocessable_entity
    end
  end

  # PATCH/PUT /transporters/1
  def update
    if @transporter.update(transporter_params)
      render json: @transporter
    else
      render json: @transporter.errors, status: :unprocessable_entity
    end
  end

  # DELETE /transporters/1
  def destroy
    @transporter.destroy
  end

  def get_carriers
    @transporter = Transporter.find(params[:transporter_id])
    if
      render json: @transporter.carriers
    else
      render json: @transporter.errors, status: :unprocessable_entity
    end
  end

  private

  # Use callbacks to share common setup or constraints between actions.
  def set_transporter
    @transporter = Transporter.find(params[:id])
  end

  # Only allow a trusted parameter "white list" through.
  def transporter_params
    params.require(:transporter).permit(:name, :siret,
                                        carriers: %i[name
                                                     age
                                                     has_driver_licence_a
                                                     has_driver_licence_b
                                                     has_driver_licence_c],
                                        postal_codes: [])
  end
end
