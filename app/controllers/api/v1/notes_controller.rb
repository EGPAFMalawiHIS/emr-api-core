class Api::V1::NotesController < ApplicationController
  before_action :set_note, only: [:show, :update, :destroy]

  respond_to :json

  def index
    @notes = Note.all
    respond_with(@notes)
  end

  def show
    respond_with(@note)
  end

  def create
    @note = Note.new(note_params)
    @note.save
    respond_with(@note)
  end

  def update
    @note.update(note_params)
    respond_with(@note)
  end

  def destroy
    @note.destroy
    respond_with(@note)
  end

  private
    def set_note
      @note = Note.find(params[:id])
    end

    def note_params
      params.require(:note).permit(:note_type, :patient_id, :obs_id, :encounter_id, :text, :priority, :parent, :creator, :date_created, :changed_by, :date_changed, :uuid)
    end
end
