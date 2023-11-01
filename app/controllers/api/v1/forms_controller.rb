class Api::V1::FormsController < ApplicationController
  before_action :set_form, only: [:show, :update, :destroy]

  respond_to :json

  def index
    @forms = Form.all
    respond_with(@forms)
  end

  def show
    respond_with(@form)
  end

  def create
    @form = Form.new(form_params)
    @form.save
    respond_with(@form)
  end

  def update
    @form.update(form_params)
    respond_with(@form)
  end

  def destroy
    @form.destroy
    respond_with(@form)
  end

  private
    def set_form
      @form = Form.find(params[:id])
    end

    def form_params
      params.require(:form).permit(:name, :version, :build, :published, :description, :encounter_type, :template, :xslt, :creator, :date_created, :changed_by, :date_changed, :retired, :retired_by, :date_retired, :retired_reason, :uuid)
    end
end
