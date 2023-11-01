class Api::V1::NotificationAlertsController < ApplicationController
  before_action :set_notification_alert, only: [:show, :update, :destroy]

  respond_to :json

  def index
    @notification_alerts = NotificationAlert.all
    respond_with(@notification_alerts)
  end

  def show
    respond_with(@notification_alert)
  end

  def create
    @notification_alert = NotificationAlert.new(notification_alert_params)
    @notification_alert.save
    respond_with(@notification_alert)
  end

  def update
    @notification_alert.update(notification_alert_params)
    respond_with(@notification_alert)
  end

  def destroy
    @notification_alert.destroy
    respond_with(@notification_alert)
  end

  private
    def set_notification_alert
      @notification_alert = NotificationAlert.find(params[:id])
    end

    def notification_alert_params
      params.require(:notification_alert).permit(:text, :satisfied_by_any, :alert_read, :date_to_expire, :creator, :date_created, :changed_by, :date_changed, :uuid)
    end
end
