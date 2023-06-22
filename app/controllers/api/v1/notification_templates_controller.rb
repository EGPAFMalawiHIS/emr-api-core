class Api::V1::NotificationTemplatesController < ApplicationController
  before_action :set_notification_template, only: [:show, :update, :destroy]

  respond_to :json

  def index
    @notification_templates = NotificationTemplate.all
    respond_with(@notification_templates)
  end

  def show
    respond_with(@notification_template)
  end

  def create
    @notification_template = NotificationTemplate.new(notification_template_params)
    @notification_template.save
    respond_with(@notification_template)
  end

  def update
    @notification_template.update(notification_template_params)
    respond_with(@notification_template)
  end

  def destroy
    @notification_template.destroy
    respond_with(@notification_template)
  end

  private
    def set_notification_template
      @notification_template = NotificationTemplate.find(params[:id])
    end

    def notification_template_params
      params.require(:notification_template).permit(:name, :template, :subject, :sender, :recipients, :ordinal, :uuid)
    end
end
