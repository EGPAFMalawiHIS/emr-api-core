class Api::V1::Hl7InArchivesController < ApplicationController
  before_action :set_hl7_in_archive, only: [:show, :update, :destroy]

  respond_to :json

  def index
    @hl7_in_archives = Hl7InArchive.all
    respond_with(@hl7_in_archives)
  end

  def show
    respond_with(@hl7_in_archive)
  end

  def create
    @hl7_in_archive = Hl7InArchive.new(hl7_in_archive_params)
    @hl7_in_archive.save
    respond_with(@hl7_in_archive)
  end

  def update
    @hl7_in_archive.update(hl7_in_archive_params)
    respond_with(@hl7_in_archive)
  end

  def destroy
    @hl7_in_archive.destroy
    respond_with(@hl7_in_archive)
  end

  private
    def set_hl7_in_archive
      @hl7_in_archive = Hl7InArchive.find(params[:id])
    end

    def hl7_in_archive_params
      params.require(:hl7_in_archive).permit(:hl7_source, :hl7_source_key, :hl7_data, :date_created, :message_state, :uuid)
    end
end
