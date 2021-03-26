class NotesController < ApplicationController
  before_action :set_note, only: [:show, :update, :destroy]
  before_action :authenticate_user!

  # GET /notes
  def index
    if params[:plant_id]
      plant = Plant.find_by(id: params[:plant_id])
      if plant.user == current_user
        @notes = plant.notes_by_date
      end
    end
    # @notes = Note.all
    # @notes = current_user.notes

    render json: @notes
  end

  # GET /notes/1
  def show
    render json: @note
  end

  # POST /notes
  def create
    @note = Note.new(note_params)
    @note = current_user.notes.build(note_params)

    if @note.save
      render json: @note, status: :created, location: @note
    else
      render json: @note.errors, status: :unprocessable_entity
    end
  end

  # PATCH/PUT /notes/1
  def update
    if @note.update(note_params)
      render json: @note
    else
      render json: @note.errors, status: :unprocessable_entity
    end
  end

  # DELETE /notes/1
  def destroy
    @note.destroy
    render status: :ok
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_note
      @note = Note.find(params[:id])
    end

    # Only allow a trusted parameter "white list" through.
    def note_params
      params.require(:note).permit(:content, :plant_id)
    end
end
