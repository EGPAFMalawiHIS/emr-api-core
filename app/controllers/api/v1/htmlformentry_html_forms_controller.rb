class Api::V1::HtmlformentryHtmlFormsController < ApplicationController
  before_action :set_htmlformentry_html_form, only: [:show, :update, :destroy]

  respond_to :json

  def index
    @htmlformentry_html_forms = HtmlformentryHtmlForm.all
    respond_with(@htmlformentry_html_forms)
  end

  def show
    respond_with(@htmlformentry_html_form)
  end

  def create
    @htmlformentry_html_form = HtmlformentryHtmlForm.new(htmlformentry_html_form_params)
    @htmlformentry_html_form.save
    respond_with(@htmlformentry_html_form)
  end

  def update
    @htmlformentry_html_form.update(htmlformentry_html_form_params)
    respond_with(@htmlformentry_html_form)
  end

  def destroy
    @htmlformentry_html_form.destroy
    respond_with(@htmlformentry_html_form)
  end

  private
    def set_htmlformentry_html_form
      @htmlformentry_html_form = HtmlformentryHtmlForm.find(params[:id])
    end

    def htmlformentry_html_form_params
      params.require(:htmlformentry_html_form).permit(:form_id, :name, :xml_data, :creator, :date_created, :changed_by, :date_changed, :retired, :uuid, :description, :retired_by, :date_retired, :retire_reason)
    end
end
