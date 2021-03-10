class CareEventsController < ApplicationController
  before_action :set_care_event, only: [:show, :update, :destroy]

  # GET /care_events
  def index
    if params[:plant_id]
      @care_events = Plant.find_by_id(params[:plant_id]).this_plants_care_events
    else
      @care_events = current_user.care_events_by_date
    end
    render json: @care_events
  end

  def today
      @care_events = current_user.todays_care_events
      render json: @care_events
  end

  # GET /care_events/1
  def show
    render json: @care_event
  end

  # POST /care_events
  def create
    @care_event = current_user.care_events.build(care_event_params)

    if @care_event.save
      render json: @care_event, status: :created, location: @care_event
    else
      render json: @care_event.errors, status: :unprocessable_entity
    end
  end

  # PATCH/PUT /care_events/1
  def update
    if @care_event.update(care_event_params)
      render json: @care_event
    else
      render json: @care_event.errors, status: :unprocessable_entity
    end
  end

  # DELETE /care_events/1
  def destroy
    @care_event.destroy
    render status: :accepted
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_care_event
      @care_event = CareEvent.find(params[:id])
    end

    # Only allow a trusted parameter "white list" through.
    def care_event_params
      params.require(:care_event).permit(:event_type, :due_date, :completed, :plant_id)
    end
end
