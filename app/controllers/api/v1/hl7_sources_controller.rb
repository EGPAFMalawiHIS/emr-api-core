class Api::V1::Hl7SourcesController < ApplicationController
  before_action :set_hl7_source, only: [:show, :update, :destroy]

  respond_to :json

  def index
    @hl7_sources = Hl7Source.all
    respond_with(@hl7_sources)
  end

  def show
    respond_with(@hl7_source)
  end

  def create
    @hl7_source = Hl7Source.new(hl7_source_params)
    @hl7_source.save
    respond_with(@hl7_source)
  end

  def update
    @hl7_source.update(hl7_source_params)
    respond_with(@hl7_source)
  end

  def destroy
    @hl7_source.destroy
    respond_with(@hl7_source)
  end

  private
    def set_hl7_source
      @hl7_source = Hl7Source.find(params[:id])
    end

    def hl7_source_params
      params.require(:hl7_source).permit(:name, :description, :creator, :date_created, :uuid)
    end
end
