class PlantsController < ApplicationController
  before_action :set_plant, only: [:show, :update, :destroy]

  # GET /plants
  def index
    @plants = current_user.plants

    render json: PlantSerializer.new(@plants).serializable_hash[:data].map{|hash| hash[:attributes] } 
  end

  # GET /plants/1
  def show
    render json: @plant
  end

  # POST /plants
  def create
    # params["plant"]["watering_frequency"] = params["plant"]["watering_frequency"] + " days"
    # params["plant"]["fertilizing_frequency"] = params["plant"]["fertilizing_frequency"] + " weeks"
    @plant = current_user.plants.build(plant_params)
    # byebug

    if @plant.save
      # render json: @plant, status: :created, location: @plant
      render json: PlantSerializer.new(@plant).serializable_hash[:data][:attributes], status: :created
    else
      render json: @plant.errors.full_messages.to_sentence, status: :unprocessable_entity
    end
  end

  # PATCH/PUT /plants/1
  def update
    if @plant.update(plant_params)
      # render json: @plant
      render json: PlantSerializer.new(@plant).serializable_hash[:data][:attributes], status: :ok
    else
      render json: @plant.errors.full_messages.to_sentence, status: :unprocessable_entity
    end
  end

  # DELETE /plants/1
  def destroy
    @plant.destroy
    render status: :ok
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_plant
      @plant = Plant.find(params[:id])
    end

    # Only allow a trusted parameter "white list" through.
    def plant_params
      params.require(:plant).permit(:name, :species, :location, :watering_frequency, :fertilizing_frequency, :repotting_frequency, :pruning_frequency, :user_id, :photo)
    end
end
