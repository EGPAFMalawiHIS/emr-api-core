class Api::V1::FormentryArchivesController < ApplicationController
  before_action :set_formentry_archive, only: [:show, :update, :destroy]

  respond_to :json

  def index
    @formentry_archives = FormentryArchive.all
    respond_with(@formentry_archives)
  end

  def show
    respond_with(@formentry_archive)
  end

  def create
    @formentry_archive = FormentryArchive.new(formentry_archive_params)
    @formentry_archive.save
    respond_with(@formentry_archive)
  end

  def update
    @formentry_archive.update(formentry_archive_params)
    respond_with(@formentry_archive)
  end

  def destroy
    @formentry_archive.destroy
    respond_with(@formentry_archive)
  end

  private
    def set_formentry_archive
      @formentry_archive = FormentryArchive.find(params[:id])
    end

    def formentry_archive_params
      params.require(:formentry_archive).permit(:form_data, :date_created, :creator)
    end
end
